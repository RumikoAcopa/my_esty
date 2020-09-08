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
    erb :welcome
  end

  private

  def current_user
    User.find_by_id(session[:id])
  end

  def logged_in?
    !!current_user
  end
end
