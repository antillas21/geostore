require 'spec_helper'

describe Store do
  describe "Validations" do
    it "is invalid without a name" do
      FactoryGirl.build(:store, :name => nil).should_not be_valid
    end

    it "is invalid without an address" do
      FactoryGirl.build(:store, :address => nil).should_not be_valid
    end

    it "is invalid without a city" do
      FactoryGirl.build(:store, :city => nil).should_not be_valid
    end

    it "is invalid without a state" do
      FactoryGirl.build(:store, :state => nil).should_not be_valid
    end
  end

  describe "Defined properties" do
    it "prints full address for geocoding" do
      store = FactoryGirl.create(:store, :address => "130 Heffernan Ave.", :city => "Calexico",
                                 :state => "CA", :zipcode => "92231", :country => "United States")
      store.full_address.should == "130 Heffernan Ave., Calexico, CA, 92231, United States"

      office = FactoryGirl.create(:store, :address => "200 Imperial Ave.", :city => "Calexico", :state => "CA",
                                  :zipcode => nil, :country => nil)
      office.full_address.should == "200 Imperial Ave., Calexico, CA"
    end
  end

  describe "#Geocoding" do
    it "is geocoded when created" do
      store = FactoryGirl.build(:store)
      store.latitude.should be_nil
      store.longitude.should be_nil

      store.save
      store.reload
      store.latitude.should_not be_nil
      store.longitude.should_not be_nil
    end

    it "is geocoded when updated" do
      store = FactoryGirl.create(:store)

      original_geocode_info = store.latitude, store.longitude

      store.update_attributes(:address => "200 Imperial Ave.", :city => "Calexico", :zipcode => "92231")
      current_geocode_info = store.latitude, store.longitude

      current_geocode_info.should_not == original_geocode_info
    end
  end
end
