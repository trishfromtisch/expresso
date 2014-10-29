class AddColumnToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :other_beverage, :string
  end
end
