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
    
    if !logged_in
      redirect '/'
    end
    if params[name: params[:name], 
      size: params[:size],description: params[:description]] != ""
      @products = Product.create(params)
      redirect "/products/#{@products.id}"
    else
      redirect '/products/new'
    end
    @product.save 
    redirect "/products"
  end

  # GET: /products/5
  get "/products/:id" do
    erb :"/products/show.html"
  end

  # GET: /products/5/edit
  get "/products/:id/edit" do
    erb :"/products/edit.html"
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
