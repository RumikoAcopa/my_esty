class ProductsController < ApplicationController
  # GET: /products 
  get "/products" do
    redirect_if_not_logged_in
    erb :"/products/index.html"
  end

  # GET: /products/new 
  get "/products/new" do
    redirect_if_not_logged_in
    erb :"/products/new.html"
  end

  # POST: /products    
  post "/products" do 
    @product = Product.new(product_params)
    if @product.save
      current_user.products << @product
      redirect '/products'
    else
      flash[:error] = @product.errors.full_messages
      redirect '/products/new'
    end
  end

  get "/products/all" do
    Product.all
    erb :"/products/all_products"
  end

  # GET: /products/5  
  get "/products/:id" do    
    set_product
    #redirect_if_not_authorized
    if set_product 
      erb :"/products/show.html"
    else
      flash[:error] = "Oooops, you did it again!"
      redirect to "/products"
    end
  end


  # GET: /products/5/edit 
  get "/products/:id/edit" do
    set_product 
    redirect_if_not_authorized
    erb :"/products/edit.html"  
  end

  # PATCH: /products/5     
  patch "/products/:id" do 
    set_product
    redirect_if_not_authorized
    @product.update(cleanser: params[:cleanser],toner: params[:toner], serum: params[:serum], moisturizer: params[:moisturizer], exfoliator: params[:exfoliator], mask: params[:mask])
    redirect "/products"
  end

  # DELETE: /products/5/delete  
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

  def product_params 
    allowed = ["user_id", "package_name", "cleanser", "toner", "moisturizer", "serum", "moisturizer", "exfoliator", "mask"]
    params.select{|k| allowed.include?(k)}
  end

  def redirect_if_not_authorized 
    redirect_if_not_logged_in
    if !authorize_product(@product)
      flash[:error] = "You don't have permission to do that!"
      redirect "/products"
    end
  end
  def authorize_product(product)  
    current_user == product.user
  end

end
