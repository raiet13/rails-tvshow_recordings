class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :show
  validates :name, presence: true, uniqueness: true
  # validates_associated :show, :user

  # NOTE : Use created_at for when it was created and updated_at for when it was updated (if it was)
  # NOTE : Added "active" flag for active vs deleted recordings + method for retrieving each type <<-- Added to User model
  # NOTE : Added name for user submittable attribute



  ## Methods for allowing recording or not ##

  # Main method for allowing recording to be saved and making user updates
  def allow_recording
  end

  # Main method for checking
  def check_recording
  end

  # Check user has enough hours to record show
  def check_hours
  end

  # Check user is old enough to record show
  def check_age
  end

  # Method for updating user current hours
  def update_user_hours
  end

end
