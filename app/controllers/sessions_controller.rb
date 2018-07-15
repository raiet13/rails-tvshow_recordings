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
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      flash[:notice] = ""
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:notice] = "Log in unsuccessful, either your username or password was not found. Please try again or sign up for an account."
      render :new
    end
  end

  # Log Out
  def destroy
    if session[:user_id]
      session.clear
    end
    redirect_to root_path
  end

  # THIRD PARTY SIGN IN
  def googlelogin
    check_user = User.find_by(username: auth['info']['email'])
    if check_user
      @login_user = check_user
      session[:user_id] = @login_user.id
      redirect_to user_path(@login_user)
    else
      flash[:notice] = "Log in unsuccessful. Please try again or sign up for an account."
      render :new
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end


end
