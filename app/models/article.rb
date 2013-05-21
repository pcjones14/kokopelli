class Article < ActiveRecord::Base
  attr_accessible :body, :tags, :title, :visible, :category, :author, :promo, :image

  has_attached_file :promo
  has_attached_file :image

  paginates_per 5

  validates :title, :body, presence: true
  validates :visible, :inclusion => {:in => [true, false]}

end
