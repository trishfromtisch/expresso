class CreateCovetedCoffees < ActiveRecord::Migration
  def change
    create_table :coveted_coffees do |t|
    	t.integer :post_id
    	t.integer :user_id
    end
  end
end
