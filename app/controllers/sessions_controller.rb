class SessionsController < ApplicationController
    get '/login' do #purpose of the route is to show/render login page aka login form
      erb :'/sessions/login' #need to mount controller in config.ru
    end
  
    post '/login' do 
        user = User.find_by_email(params[:email])  # find the user by their user email:
        if user && user.authenticate(params[:password]) # if they typed in the right password 
            session[:id] = user.id                 #then log them in, if not show them the form again
            redirect "/"
          else 
            @error = "Incorrect email or password"
            erb :'/sessions/login'
        end
    end
    delete '/logout' do
        session.clear
        redirect "/"
      end
end
   
    