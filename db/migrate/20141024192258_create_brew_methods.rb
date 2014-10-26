class CreateBrewMethods < ActiveRecord::Migration
  def change
    create_table :brew_methods do |t|
    	t.string :name
    end
  end
end
