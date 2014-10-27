class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	belongs_to :coveted_coffees
	has_one :beverage
	has_one :brewing_method
	has_many :likes
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end