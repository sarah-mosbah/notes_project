class SessionsController < ApplicationController
  
    def create

        user= User.get_user(params[:user][:email],params[:user][:password])
        if user.nil?
          flash[:invalid]="Invalid Credentials"
          puts "fails"
          else
            login(user) 
          end
    end

    def new
        render :new
    end

    def destroy
        logout!
        redirect_to new_session_path
    end
end
