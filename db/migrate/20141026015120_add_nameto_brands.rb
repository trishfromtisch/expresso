class AddNametoBrands < ActiveRecord::Migration
  def change
  	add_column :brands, :name, :string
  end
end
