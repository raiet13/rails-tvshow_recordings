class Show < ApplicationRecord
  validates_presence_of :name, :req_recording_hours, :req_age
  validates :req_recording_hours, numericality: { less_than_or_equal_to: 200 }

  has_many :recordings
  has_many :users, through: :recordings
  has_many :characters
  # NOTE : MAYBE For additional complexity later -- has_many show_genres | has_many genres through show_genres


  # Class scope method for requirement?
  def self.most_recorded
    # TaJ (3) -> OUAT/S (2)
    num_recordings = {}
    Show.all.collect do |show|
      num_recordings[show.name] = show.num_recordings
    end
    sorted = num_recordings.sort_by{ |show, rec_count| rec_count }.reverse
    # sorted.first
  end

  def num_recordings
    self.recordings.count
  end
  
  def recording_name
    self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
  end

end
