class ApplicationController < ActionController::Base
  include ApplicationHelper

  def home
    flash[:notice] = ""
    if logged_in?
      redirect_to user_path(current_user)
    end
  end

end
