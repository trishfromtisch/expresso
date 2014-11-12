class User < ActiveRecord::Base
	self.has_secure_password()
	has_many :coveted_coffees
	has_many :posts
	has_many :likes
	has_many :coffee_bars, through: :posts
	has_many :relationships
	has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
	validates :name, presence: true
	validates :full_name, presence: true
	validates :email, presence: true
	validates :city, presence: true
	validates :password, confirmation: true
	validates :password_confirmation, presence: true
end