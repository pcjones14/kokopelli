class User < ActiveRecord::Base
  attr_accessible :email, :password, :name, :bio, :avatar

  has_attached_file :avatar

  has_many :articles, dependent: :destroy
  
end
