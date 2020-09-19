class SessionsController < ApplicationController
    get '/login' do 
      erb :'sessions/login' 
    end
    
  
    post '/login' do  
      @user = User.find_by(email: params[:email])  
      
      if @user && @user.authenticate(params[:password])  
        session[:user_id] = @user.id  
        puts session               
        redirect "/users/#{@user.id}"             
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
   
    