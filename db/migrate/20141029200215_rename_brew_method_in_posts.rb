class RenameBrewMethodInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :brew_method_id, :brewing_method_id
  end
end
