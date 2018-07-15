class Character < ApplicationRecord
  belongs_to :show
  validates_presence_of :name
  validates_associated :show

end
