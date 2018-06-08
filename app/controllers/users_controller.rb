class UsersController < ApplicationController
  before_action :redirect_if_not_logged_in

  # Show All Users
  def index
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
    user = User.new(user_params)
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
    # maybe only show username for modification? -- TBD
  end

  # Update User Info?
  def update
    # NOTE : Same as above -- maybe just do user edit info as delete path on show page and then through the recordings model (allow recording/deactive/etc.)
  end

  # Delete User
  def destroy
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :age, :recording_hours)
  end

end
