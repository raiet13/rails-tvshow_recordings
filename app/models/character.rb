class Character < ApplicationRecord
  belongs_to :show
  validates_presence_of :name
  validates_associated :show

  def self.most_viewed
    self.select(:name, :char_page_views).order(char_page_views: :asc)
  end

end
