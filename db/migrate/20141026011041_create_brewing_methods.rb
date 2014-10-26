class CreateBrewingMethods < ActiveRecord::Migration
  def change
    create_table :brewing_methods do |t|
    	t.string :name
    end
  end
end
