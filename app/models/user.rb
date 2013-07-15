class User < ActiveRecord::Base
  attr_accessible :name, :title
  has_many :comments
  validates :name, :presence => true
end
