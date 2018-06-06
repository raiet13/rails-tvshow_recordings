class ApplicationController < ActionController::Base

  def home
    if logged_in
      redirect_to user_path(current_user)
    end
  end

end
