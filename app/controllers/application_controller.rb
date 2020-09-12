require './config/environment'

class ApplicationController < Sinatra::Base

  configure do #sinatra looks here when I render files
    set :public_folder, 'public'
    set :views, 'app/views'
    set :sessions, true
    set :session_secret, ENV["SESSION_SECRET"] #xtra layer of security, session id created for particular session
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

    def logged_in? #true if user is logged in, otherwise false
      !!current_user #dbl bang obj of truthiness. 
    end
  
    def current_user 
      @current_user ||= User.find_by(id: session[:user_id])#current user returns
    end   #reduce the # of db calls assigining it to an instance variable
  end   #have we added a users id key to the hash
end    
