# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :store do
    name "First International Store"
    address "1200 Highland Avenue"
    city "National City"
    state "CA"
    zipcode "91950"
  end
end
