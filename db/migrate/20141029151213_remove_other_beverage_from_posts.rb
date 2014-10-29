class RemoveOtherBeverageFromPosts < ActiveRecord::Migration
  def change
  	remove_column :posts, :other_beverage
  end
end
