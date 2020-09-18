require './config/environment'#loads the environment file

class ApplicationController < Sinatra::Base #give other controllers access to Sinatra
  configure do 
    set :public_folder, 'public' #hold stylesheets 
    set :views, 'app/views' #look for views in this folder
    set :sessions, true #enabling sessions for users to visit different pages without having to keep logging in each time ( enables cookies)
    set :session_secret, ENV["SESSION_SECRET"] # environment variable session secret, sign cookies with a secure key to make it harder to steal
    set :method_override, true #lets you overide the post method in the form to let you use patch and delete
    register Sinatra::Flash # allows you to display message to the user such as an error message 
  end

  get "/" do #get route for my "root" of my application, http verb that is setting the index route to render welcome page
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  
  private #can't be used outside of the scope of this file
  helpers do

    def logged_in? #confirming whether or not the users is logged in ..checks by session id. If no id it will return false and if yes return true
      !!current_user  #double bang which returns a boolean 
    end

    def redirect_if_not_logged_in #conditional statement to see if user is logged in if not redirect to login
      if !logged_in?              #flash error message to user if user is not logged in
        flash[:error] = "You must be logged in to view that page"
        redirect "/login"
      end
    end
  
    def current_user #helper method to determine if the user has an active session 
      @current_user ||= User.find_by(id: session[:user_id]) #checks to see if variable on L has a value if not sets variable to whats on the R.
    end   
  end   
end    
