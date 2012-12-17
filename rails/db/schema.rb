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

ActiveRecord::Schema.define(:version => 20121217222026) do

  create_table "floors", :force => true do |t|
    t.integer  "mall_id"
    t.text     "svg"
    t.string   "label"
    t.integer  "order"
    t.boolean  "main"
    t.string   "source_map_file_name"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  add_index "floors", ["mall_id", "order"], :name => "index_floors_on_mall_id_and_order", :unique => true
  add_index "floors", ["mall_id"], :name => "index_floors_on_mall_id"

  create_table "malls", :force => true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.string   "email"
    t.string   "phone"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "database"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "schedules", :force => true do |t|
    t.integer  "mall_id",                   :null => false
    t.integer  "priority",   :default => 0, :null => false
    t.string   "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "schedules", ["end_date"], :name => "index_schedules_on_end_date"
  add_index "schedules", ["mall_id"], :name => "index_schedules_on_mall_id"
  add_index "schedules", ["start_date"], :name => "index_schedules_on_start_date"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true

  create_table "vendor_categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "vendor_categories", ["name"], :name => "index_vendor_categories_on_name", :unique => true

  create_table "vendor_categories_vendors", :id => false, :force => true do |t|
    t.integer "vendor_id"
    t.integer "category_id"
  end

  create_table "vendors", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.text     "website"
    t.string   "contact_email"
    t.text     "logo"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "vendors", ["name"], :name => "index_vendors_on_name"

end
