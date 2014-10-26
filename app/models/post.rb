class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :coveted_coffees
	has_one :brand
	has_one :beverage
	has_one :brewing_method
	has_many :likes
end