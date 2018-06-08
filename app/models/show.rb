class Show < ApplicationRecord
  validates_presence_of :name, :req_recording_hours, :req_age
  validates :req_recording_hours, numericality: { less_than_or_equal_to: 200 }

  has_many :recordings
  has_many :users, through: :recordings
  has_many :characters
  # NOTE : MAYBE For additional complexity later -- has_many show_genres | has_many genres through show_genres



end
