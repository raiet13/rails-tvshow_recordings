class User < ApplicationRecord
  has_secure_password
  validates :name, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  before_create :set_current_recording_hours_default

  has_many :recordings
  has_many :shows, through: :recordings

  # User's favorite genre as denoted by the number of shows recorded
  # NOTE : Used "all recordings shows as it was the simplest association to grab"
  def fav_genre
    # NOTE : DID NOT ADD GENRES YET
    # r.shows.genres
    "WIP - no genres yet"
  end

  # User's current number of active recordings
  def active_recordings
    self.recordings.where(active: true)
  end

  # List of all recordings that user has created
  def all_recordings
    self.recordings
  end

  # NOTE : Add checks for recordings (show is age appropriate / has enough recording hours)
  # NOTE : Need to confirm that age and recording hours is not null (report that recordings require reported age/recording hours to be valid)
    # t.integer :age
    # t.integer :recording_hours



  private

  # Set the current recordings to the total upon creation <<-- current implementation rather than multiple methods given scale of app
  def set_current_recording_hours_default
    self.current_recording_hours = self.total_recording_hours
  end

end
