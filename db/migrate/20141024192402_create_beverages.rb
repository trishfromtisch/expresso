class CreateBeverages < ActiveRecord::Migration
  def change
    create_table :beverages do |t|
    	t.string :name
    end
  end
end
