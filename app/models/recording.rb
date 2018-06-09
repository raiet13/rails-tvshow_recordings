class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :show
  # validates_associated :show, :user

  # NOTE : Use created_at for when it was created and updated_at for when it was updated (if it was)
  # NOTE : Added "active" flag for active vs deleted recordings + method for retrieving each type <<-- Added to User model
  # NOTE : Added name for user submittable attribute

end
