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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20140629063638) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "friendships", force: true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "location_records", force: true do |t|
    t.integer  "locatable_id"
    t.string   "locatable_type"
    t.spatial  "location",       limit: {:srid=>4326, :type=>"point", :geographic=>true}
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "location_records", ["location"], :name => "index_location_records_on_location", :spatial => true

  create_table "rides", force: true do |t|
    t.string   "name"
    t.integer  "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.decimal  "total_cost"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_rides", force: true do |t|
    t.integer  "user_id"
    t.integer  "ride_id"
    t.boolean  "paid?"
    t.boolean  "accepted"
    t.decimal  "total_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.boolean  "has_car?"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
