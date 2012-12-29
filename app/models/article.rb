class Article < ActiveRecord::Base
  attr_accessible :body, :tags, :title, :visible
end
