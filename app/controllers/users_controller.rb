class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"users/index.html"
  end

  # GET: /users/new 
  get "/users/new" do
    
    erb :"users/new.html"
  end

  # POST: /users   
  post "/users/new" do 
    @user = User.create(params)   
    if @user.save
      session[:user_id] = @user.id  
      redirect "/users/#{@user.id}" 
    else                            
      @error = "Uh-Oh, Missing Field/Username may be taken.  Try Again"
      erb :'/users/new.html' 
    end
  end


  get '/signup' do
    erb :'/signup'
  end

  post '/signup' do
  end

  # GET: /users/5
  get '/users/:id' do 
    if @user = User.find_by(id: params[:id])
      erb :'users/show.html'
    else 
      flash[:error] = "Ooops.."
      redirect to "/users/#{current_user.id}"
    end
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
