class SessionsController < ApplicationController
    get '/login' do #purpose of the route:to show/render login page aka login form
      erb :'sessions/login' #need to mount controller in config.ru
    end
    
  
    post '/login' do #purpose to receive Login Form, adding key value pair to session hash
        @user = User.find_by(email: params[:email])  # find the user by their user email: & log them in
        if @user && @user.authenticate(params[:password]) # verify user, 
          session[:user_id] = @user.id  
          puts session               #then log them in, if not show them the form again
          redirect "/users/#{@user.id}"             #authenticate and redirect to users landing page
        else 
          @error = "Incorrect email or password"
          erb :'sessions/login'
        end
    end

    delete '/logout' do
      session.clear
      redirect "/"
    end
end
   
    