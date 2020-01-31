class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save()
      redirect_to '/welcome'
    else  
      render 'new' and return
    end
  end
end