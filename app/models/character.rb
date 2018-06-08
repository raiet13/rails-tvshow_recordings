class Character < ApplicationRecord
  belongs_to :show
  validates_associated :show

end
