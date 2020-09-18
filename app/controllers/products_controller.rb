class ProductsController < ApplicationController
  # GET: /products # renders the users index which displays their products and has a specific backgrd image 
  get "/products" do
    redirect_if_not_logged_in
    erb :"/products/index.html"
  end

  # GET: /products/new #renders the new product form
  get "/products/new" do
    redirect_if_not_logged_in
    erb :"/products/new.html"
  end

  # POST: /products   # post method that collects the forms data in params and creates a new product and adds it 
  post "/products" do #to the users list of products then redirects to the products page which displays users products
    @product = Product.new(product_params)
    if @product.save
      current_user.products << @product
      redirect '/products'
    else
      flash[:error] = @product.errors.full_messages
      redirect '/products/new'
    end
  end

  # GET: /products/5  #initiates a products variable which then finds a drink based on the params :id  
  get "/products/:id" do    #and renders the products show page which shows the details of the drink
    set_product
    redirect_if_not_authorized
    erb :"/products/show.html"
  end

  # GET: /products/5/edit #http verb that renders the edit form of a users product that was pulled by the params id
  get "/products/:id/edit" do
    set_product 
    redirect_if_not_authorized
    erb :"/products/edit.html"  
  end

  # PATCH: /products/5    #http verb that updates the product/pkg with the data that was sent from the edit form 
  patch "/products/:id" do #then redirects to users list of product pkg
    set_product
    redirect_if_not_authorized
    @product.update(cleanser: params[:cleanser],toner: params[:toner], serum: params[:serum], moisturizer: params[:moisturizer], exfoliator: params[:exfoliator], mask: params[:mask])
    redirect "/products"
  end

  # DELETE: /products/5/delete # deletes a users product/pkg when called then redirects to the product/pkg page to display users products 
  delete "/products/:id" do
    set_product
    redirect_if_not_authorized
    @product.destroy
    redirect "/products"
  end
  private
  def set_product
    @product = Product.find_by(id: params[:id])
  end

  def product_params #created an array w/selected attributes I want to include and selecting the key/value I wnt to select in params
    allowed = ["user_id", "package_name", "cleanser", "toner", "moisturizer", "serum", "moisturizer", "exfoliator", "mask"]
    params.select{|k| allowed.include?(k)}
  end

  def redirect_if_not_authorized #helper method redirect the user if they try to access a pg/product that doesn't belong to them
    redirect_if_not_logged_in
    if !authorize_product(@product)
      flash[:error] = "You don't have permission to do that!"
      redirect "/products"
    end
  end
  def authorize_product(product)  #checking to see if the user owns that product
    current_user == product.user #comparing the current User to the product of the User
  end

end
