class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :coveted_coffees
	belongs_to :beverage
	belongs_to :coffee_bar
	belongs_to :brewing_method
	has_many :relationships
	validates :user_id, presence: true 
	validates :beverage_id, presence: true
	validates :brewing_method_id, presence: true
	validates :coffee_rating, presence: true	
	validates :coffee_bar_id, presence: true	
	validates :roaster, presence: true	
	validates :description, presence: true	
	validates :title, presence: true		
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end

