class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :recordings
  has_many :shows, through: :recordings


  # NOTE : Add checks for recordings (show is age appropriate / has enough recording hours)
  # NOTE : Need to confirm that age and recording hours is not null (report that recordings require reported age/recording hours to be valid)
    # t.integer :age
    # t.integer :recording_hours


end
