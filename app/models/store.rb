class Store < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :address, :city, :state, :country, :zipcode

  validates_presence_of :name, :address, :city, :state

  geocoded_by :full_address
  after_validation :geocode

  def full_address
    [address, city, state, zipcode, country].compact.join(', ')
  end
end
