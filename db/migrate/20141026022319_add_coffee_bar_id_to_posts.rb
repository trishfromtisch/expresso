class AddCoffeeBarIdToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :coffee_bar_id, :integer
  end
end
