class User < ApplicationRecord
  has_secure_password
  validates_presence_of :name, :password
  validates :username, presence: true, uniqueness: true
  validates :total_recording_hours, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }
  validates :age, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 200 }

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
  
  def num_active_recordings
    self.active_recordings.count
  end
  
  def num_recordings
    self.all_recordings.count
  end
  
  def user_has_show(show)
    check_show = self.shows.include?(show)
    if check_show
     return show
    end
  end

  def current_recording_hours
    current_hours = 0
    self.active_recordings.each do |rec|
      current_hours += rec.show.req_recording_hours
    end
    self.total_recording_hours - current_hours
  end

end
