class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]
  def new
    @user = User.new
  end

  def create
    @user = User.new(params.require(:user).permit(:username, :email, :password, :password_confirmation))
    if @user.save()
      session[:user_id] = @user.id
      redirect_to '/welcome'
    else  
      render 'new' and return
    end
  end
end