class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|

    	t.string :name, :null => false
    	t.string :address, :null => false
    	t.string :city
    	t.string :state
    	t.string :zipcode
    	t.string :country
    	t.decimal :latitude, :precision => 10, :scale => 6
    	t.decimal :longitude, :precision => 10, :scale => 6
      t.timestamps
    end
  end
end
