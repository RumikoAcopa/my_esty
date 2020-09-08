require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end
  
  def current_user
    User.find_by_id(session[:id])
  end
  def logged_in?
    !!current_user
  end
end
