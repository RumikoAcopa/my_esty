class SessionsController < ApplicationController
    get '/login' do #purpose of the route:to show/render login page aka login form
      erb :'/sessions/login' #need to mount controller in config.ru
    end
    
  
    post '/login' do #purpose to receive Login Form
        @user = User.find_by(email: params[:email])  # find the user by their user email: & log them in
        if @user && @user.authenticate(params[:password]) # verify user, 
            session[:id] = @user.id                 #then log them in, if not show them the form again
            redirect "users/#{@user.id}"                            #authenticate and redirect to users landing page
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
   
    