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
  post "/users" do #here is where we will create a new user
    @user = User.create(params)
      if @user.save
      session[:user_id] = @user.id  #logs the user in once they sign up 
                              #then log them in, if not show them the form again
                              #and persist the new user to db
      redirect "/users/#{@user.id}" #params will look like this: "name"=>"Rumiko"
      else
        #it would be nice to include a message telling them what is wrong
      redirect '/signup'
    end
  end


  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
    #@user = User.new(name: params[:name], email: params[:email], password: params[:password])
    #if @user.save
    #session[:user_id] = @user.id
    # redirect "/sessions/login"
    #else
    #  @error = "Think Again!"
    #  erb :'/users/new
    #end
  end

  # GET: /users/5
  get '/users/:id' do #this will be the users show route
    #first create variable
    @user = User.find_by(id: params[:id])
      #whats the act of logging someone in w/bcrypt

    #erb :'/users/show'
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
  private
  def validate_input 
    params[:name] != "" && params[:email] != "" &&
    params[:password] != "" 
  end
end
