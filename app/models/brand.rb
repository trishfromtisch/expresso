class Brand < ActiveRecord::Base
	belongs_to :post
	has_many :beverages, through: posts
	has_many :brewing_methods, through: posts
end