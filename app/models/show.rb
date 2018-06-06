class Show < ApplicationRecord
  has_many :recordings
  has_many :users, through: :recordings
  has_many :characters
  # NOTE : MABYE For additional complexity later -- has_many show_genres | has_many genres through show_genres

end
