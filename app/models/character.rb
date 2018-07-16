class Character < ApplicationRecord
  belongs_to :show
  validates_presence_of :name
  validates_associated :show

  def self.most_viewed_by_show(char_show)
    chars = self.select(:name, :char_page_views).where(show: char_show)
    chars.select(:name, :char_page_views).order(char_page_views: :desc).first
  end
  
  def self.by_views_by_show(char_show)
    chars = self.select(:name, :char_page_views).where(show: char_show)
    chars.select(:name, :char_page_views).order(char_page_views: :desc)
  end

  def self.most_viewed
    chars.select(:name, :char_page_views).order(char_page_views: :desc).first
  end

  def self.by_views
    self.select(:name, :char_page_views).order(char_page_views: :desc)
  end

end
