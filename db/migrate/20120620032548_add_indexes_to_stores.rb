class AddIndexesToStores < ActiveRecord::Migration
  def change
    add_index(:stores, :name)
    add_index(:stores, :address)
    add_index(:stores, :city)
    add_index(:stores, :state)
    add_index(:stores, :zipcode)
    add_index(:stores, [:latitude, :longitude], :name => 'by_latitude_and_longitude')
    add_index(:stores, [:address, :city, :state, :zipcode], :name => 'by_full_address')
    add_index(:stores, [:city, :state], :name => 'by_city_and_state')
  end
end
