class Article < ActiveRecord::Base
  attr_accessible :body, :tags, :title, :visible, :category, :author, :promo, :image, :user_id

  has_attached_file :promo
  has_attached_file :image

  paginates_per 5

  validates :title, :body, presence: true
  validates :visible, :inclusion => {:in => [true, false]}

  belongs_to :user

end
