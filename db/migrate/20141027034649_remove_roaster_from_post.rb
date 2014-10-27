class RemoveRoasterFromPost < ActiveRecord::Migration
  def change
  	remove_column :posts, :roaster
  end
end
