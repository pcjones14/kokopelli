class Article < ActiveRecord::Base
  attr_accessible :body, :tags, :title, :visible

  validates :title, :body, presence: true
  validates :visible, :inclusion => {:in => [true, false]}

end
