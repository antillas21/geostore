# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120620032548) do

  create_table "stores", :force => true do |t|
    t.string   "name",                                      :null => false
    t.string   "address",                                   :null => false
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "country"
    t.decimal  "latitude",   :precision => 10, :scale => 6
    t.decimal  "longitude",  :precision => 10, :scale => 6
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

  add_index "stores", ["address", "city", "state", "zipcode"], :name => "by_full_address"
  add_index "stores", ["address"], :name => "index_stores_on_address"
  add_index "stores", ["city", "state"], :name => "by_city_and_state"
  add_index "stores", ["city"], :name => "index_stores_on_city"
  add_index "stores", ["latitude", "longitude"], :name => "by_latitude_and_longitude"
  add_index "stores", ["name"], :name => "index_stores_on_name"
  add_index "stores", ["state"], :name => "index_stores_on_state"
  add_index "stores", ["zipcode"], :name => "index_stores_on_zipcode"

end
