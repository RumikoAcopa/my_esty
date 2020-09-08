class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/users/new" do
    erb :"/users/new.html"
  end

  # POST: /users
  #post "/users" do
  #  redirect "/users"
  #end

  get '/signup' do
    erb :'/users/new'
  end

  post '/signup' do
    @user = User.new(name: params[:name], email: params[:email], password: params[:password])
    if @user.save
      session[:id] = @user.id
      redirect "/sessions/login"
    else
      @error = "Think Again, Try harder this time!"
      erb :'/users/new.html'
    end
  end

  # GET: /users/5
  get '/users/:id' do #this will be the users show route
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
