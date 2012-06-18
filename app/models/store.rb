class Store < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name, :address, :city, :state, :country, :zipcode

  validates_presence_of :name, :address, :city, :state

  geocoded_by :full_address
  after_validation :geocode

  acts_as_gmappable :address => :full_address, :check_process => false

  def full_address
    [address, city, state, zipcode, country].compact.join(', ')
  end

  def geodata
    "lat: #{latitude}, lng: #{longitude}"
  end

  def infowindow_data
    infowindow = "<strong>#{name}</strong><br />#{address}<br />"
    infowindow << [city, state, zipcode, country].compact.join(', ')
    return infowindow
  end

  def gmaps4rails_infowindow
    infowindow_data
  end
end
