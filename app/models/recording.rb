class Recording < ApplicationRecord
  belongs_to :user
  belongs_to :show
  # validates_associated :show, :user

  # NOTE : Use created_at for when it was created and updated_at for when it was updated (if it was)
  # NOTE : Add "active" flag for active vs deleted recordings + method for retrieving each type

end
