class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string :name
    	t.string :password_digest
    	t.string :full_name
    	t.string :email
    	t.string :city
    	t.attachment :avatar
    	t.timestamps
    end
  end
end

