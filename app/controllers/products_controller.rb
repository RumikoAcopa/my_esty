class ProductsController < ApplicationController
  #get product/new to create new product entry
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
    #if !logged_in?
    # redirect '/'
    #end
    #if params[name:] != ""
    # @products = Products.create(name: params[:name],
    # user_id: current_user.id)
    # redirect "/products/show.html#{@products.id}"
    #else
    # redirect '/products/new'
    #end
    #@product.save 
   #
    #current_user.products << Product.create(params)
    
  end

  # GET: /products/5 #dynamic route key/val pr in params hash
  get "/products/:id" do #render a part.product creation
    @products = Product.find(params[:id])
    erb :"/products/show.html"
  end

  # GET: /products/5/edit #this route should render edit.erb Product/edit.erb for Edit Form
  get "/products/:id/edit" do

    erb :"/products/edit.html" #a file 
  end

  # PATCH: /products/5
  patch "/products/:id" do
    redirect "/products/:id"
  end

  # DELETE: /products/5/delete
  delete "/products/:id/delete" do
    redirect "/products"
  end
end
