class User < ApplicationRecord
  has_secure_password
  # NOTE : INSERT VALIDATIONS here
  has_many :recordings
  has_many :shows, through: :recordings


  # NOTE : Add checks for recordings (show is age appropriate / has enough recording hours)

end
