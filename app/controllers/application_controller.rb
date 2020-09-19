require './config/environment'

class ApplicationController < Sinatra::Base 
  configure do 
    set :public_folder, 'public' 
    set :views, 'app/views' 
    set :sessions, true 
    set :session_secret, ENV["SESSION_SECRET"] 
    set :method_override, true 
    register Sinatra::Flash  
  end

  get "/" do 
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  
  private 
  helpers do

    def logged_in? 
      !!current_user   
    end

    def redirect_if_not_logged_in 
      if !logged_in?              
        flash[:error] = "You must be logged in to view that page"
        redirect "/login"
      end
    end
  
    def current_user  
      @current_user ||= User.find_by(id: session[:user_id]) 
    end  
    
    def allowed_to_edit?(product) 
      product.user == current_user
    end
  end   
end    
