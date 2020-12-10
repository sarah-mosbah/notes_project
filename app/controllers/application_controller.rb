class ApplicationController < ActionController::Base

  

    def login(user)
        @curent_user= user
        session[:token]=user.session_token
    end


    def current_user
       return nil if session[:token].nil?
       @curent_user ||=User.find_by(session_token: session[:token])
    end

    def required_current_user
         redirect_to '/login' unless current_user
    end

    def logout
        session[:token]=nil
        redirect_to '/login' 
    end

end
