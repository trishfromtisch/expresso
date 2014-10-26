class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
    	t.integer :user_id
    	t.integer :beverage_id
    	t.integer :brand_id
    	t.integer :brew_method_id
    	t.integer :coffee_rating
    	t.attachment :avatar
    	t.timestamps
    end
  end
end
