class SessionController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]
  layout 'startingpage', only: [:login, :new]

  def new
  end

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      puts "User found with id #{@user.id}"
      session[:user_id] = @user.id
      redirect_to "/welcome"
    else
      redirect_to "/login", notice: "Wrong username or password"
    end
  end

  def login
  end

  def welcome
    puts "User in session id: #{session[:user_id]}"
  end

  def logout
    session[:user_id] = nil
    redirect_to "/login"  
  end

  def page_requires_login
  end
end
