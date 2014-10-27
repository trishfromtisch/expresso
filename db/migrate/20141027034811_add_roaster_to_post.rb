class AddRoasterToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :roaster, :string
  end
end
