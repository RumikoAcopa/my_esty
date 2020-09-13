class ProductsController < ApplicationController
  # GET: /products
  get "/products" do
    erb :"/products/index.html"
  end

  # GET: /products/new
  get "/products/new" do
    
    erb :"/products/new.html"
  end

  # POST: /products
  post "/products" do
    @product = Product.create(product_params)
    current_user.products << @product
    redirect '/products'
  end

  # GET: /products/5 
  get "/products/:id" do  
    set_products
    erb :"/products/show.html"
  end

  # GET: /products/5/edit 
  get "/products/:id/edit" do
    set_products 
    erb :"/products/edit.html"  
  end

  # PATCH: /products/5  
  patch "/products/:id" do 
    set_products
    @products.update(cleanser: params[:cleanser],toner: params[:toner], serum: params[:serum], moisturizer: params[:moisturizer], exfoliator: params[:exfoliator], mask: params[:mask])
    redirect "/products"
  end

  # DELETE: /products/5/delete
  delete "/products/:id" do
    @product = Product.find(params[:id])
    @product.destroy
    redirect "/products"
  end
  private
  def set_products
    @products = Product.find_by(id: params[:id])
  end

  def product_params
    allowed = ["user_id", "package_name", "cleanser", "toner", "moisturizer", "serum", "moisturizer", "exfoliator", "mask"]
    params.select{|k| allowed.include?(k)}
  end

  def redirect_if_not_authorized
    redirect_if_not_logged_in
    if !authorize_product(@products)
      flash[:error] = "You don't have permission to do that!"
      redirect "/products"
    end
  end
  def authorize_product(product)
    current_user == product.author
  end
  def logged_in
    !!current_user
  end
  def redirect_if_not_logged_in
    if !logged_in?
      flash[:error] = "You must be logged in to view that page"
      redirect request.referrer || "/login"
    end
  end

end
