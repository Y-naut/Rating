class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
    	t.string :title
    	t.text :description 
    	t.string :address

      t.timestamps null: false
    end
  end
end
