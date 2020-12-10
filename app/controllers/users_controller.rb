class UsersController < ApplicationController
  def create
       @user= User.new(user_params)

       if @user.save
         login(@user)
         puts "success"
       else
        flash[:errors]= @user.errors.full_messages
        
        redirect_to new_user_path
       end
  end

  def new
    @user=User.new
  end


  private
  def user_params
    params.require(:user).permit(:email,:password)
  end
end
