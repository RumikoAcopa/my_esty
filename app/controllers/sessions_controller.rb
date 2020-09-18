class SessionsController < ApplicationController
    get '/login' do #renders users log in form #sessions controller handles the beginning and end of a session 
      erb :'sessions/login' 
    end
    
  
    post '/login' do # collect the users log in information and makes sure the username and password is valid then starts a new session with the id 
      @user = User.find_by(email: params[:email])  # checking user for that email if used to sign up
      # if they typed in the right password then log them in, if not show them the form again
      if @user && @user.authenticate(params[:password]) #authenticate hashes what the users types in then compares it to the hash version of the original password 
        session[:user_id] = @user.id #ACTUALLY LOGGING THEM IN! 
        puts session               
        redirect "/users/#{@user.id}"             
        else 
          @error = "Incorrect email or password"
          erb :'sessions/login'
        end
    end

    delete '/logout' do #logs out and clears the session hash 
      session.clear     #clears session/all data goes bye bye!
      redirect "/"
    end
end
   
    