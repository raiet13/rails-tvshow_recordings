class SessionsController < ApplicationController

  # Log In Page
  def new
    if logged_in?
      redirect_to user_path(current_user)
    end
    @users = User.all
  end

  # Log In Authentication
  def create
    # puts "Sign In Params = #{params}"
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Log in unsuccessful, either your username or password was not found. Please try again or sign up for an account."
      render :new # NOTE : So that user doesn't have to re-enter info from scratch if they don't want
    end
  end

  # Log Out
  def destroy
    if session[:user_id]
      session.clear
    end
    redirect_to root_path
  end

end
