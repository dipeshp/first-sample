class Customer < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessor :name, :address
end
