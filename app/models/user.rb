class User < ActiveRecord::Base
	self.has_secure_password()
	has_many :coveted_coffees
	has_many :posts
	has_many :coffee_bars, through: :posts
	has_many :follows
end