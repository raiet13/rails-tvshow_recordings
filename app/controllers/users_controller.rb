class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  # Show All Users
  def index
    @users = User.all
  # Show All By (methods in user model)
    # User's name
    # User's (current) active recordings
    # ??? -- User's total num recordings to date
    # User's favorite show
    # User's favorite genre
  end

  # Sign Up Page
  def new
    if logged_in?
      flash[:notice] = "You are already signed in. If this is not your account, please 'Log Out'."
      redirect_to "/users/#{current_user.id}"
    else
      @new_user = User.new
    end
  end

  # User Creation/Data Authentication
  def create
    user = User.new(user_params(:name, :username, :password, :age, :total_recording_hours))
		if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
		else
      flash[:notice] = "Something went wrong during sign up, please try again."
			render :new
		end
  end

  # User Profile
  def show
    # User name
    # User's (current) active recordings
    # ??? -- User's total num recordings to date
    # User's favorite show
    # User's favorite genre
    # Link to "See All Shows" (will have recorded shows auto-checked + button to "record show?" if not)
    # Link to "See Your Recordings"
  end

  # Edit User Info?
  def edit
    user_check(params[:id])
  end

  # Update User Info
  def update
    # NOTE : Same as above -- maybe just do user edit info as delete path on show page and then through the recordings model (allow recording/deactive/etc.)
    user = User.update(user_params(:name, :username, :age))
		if user.save
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
      redirect_to user_path(user)
    end
  end

end
