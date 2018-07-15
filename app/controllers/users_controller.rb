class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in
  skip_before_action :redirect_if_not_logged_in, only: [:new, :create]

  # Show All Users
  def index
    @users = User.all
  end

  # Sign Up Page
  def new
    if logged_in?
      flash[:notice] = "You are already signed in. If this is not your account, please 'Log Out'."
      redirect_to user_path(current_user)
    else
      flash[:notice] = ""
      @new_user = User.new
    end
  end

  # User Creation/Data Authentication
  def create
    user = User.new(user_params(:name, :username, :password, :age, :total_recording_hours))
    puts "User = #{user}"
		if user.save
		  flash[:notice] = ""
      session[:user_id] = user.id
      redirect_to user_path(user)
		else
      flash[:notice] = "Something went wrong during sign up, please try again."
      @new_user = user
			render :new
		end
  end

  # User Profile
  def show
    @show_user = User.find(params[:id])
  end

  # Edit User Info
  def edit
    user_check(params[:id])
  end

  # Update User Info
  def update
    user_check(params[:id])
    user = User.update(user_params(:name, :username, :age))
		if user.save
      flash[:notice] = ""
      redirect_to user_path(user)
		else
      flash[:notice] = "Something went wrong during edit, please try again."
			render :edit
		end
  end

  # Delete User
  def destroy
    user_check(params[:id])
    current_user.destroy
    redirect_to logout_path
  end

  private

  def user_params(*args)
    params.require(:user).permit(*args)
  end

  # NOTE : Since using resources as routes, adding check that the user attempting modification is the current user
  def user_check(id)
    check_user = User.find(id)
    if check_user != current_user
      flash[:notice] = "You can only modify your own user information."
      redirect_to user_path(check_user)
    end
  end

end
