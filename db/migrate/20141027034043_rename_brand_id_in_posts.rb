class RenameBrandIdInPosts < ActiveRecord::Migration
  def change
  	rename_column :posts, :brand_id, :roaster
  end
end
