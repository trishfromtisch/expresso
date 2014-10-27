class RenameFollowerIdInFollows < ActiveRecord::Migration
  def change
  	rename_column :follows, :follower_id, :tastemaker_id
  end
end
