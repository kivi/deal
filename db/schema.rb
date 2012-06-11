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

ActiveRecord::Schema.define(:version => 20120122182233) do

  create_table "deals", :force => true do |t|
    t.boolean  "is_active"
    t.boolean  "is_running"
    t.string   "product_type"
    t.string   "title"
    t.text     "descritpion"
    t.integer  "price_original"
    t.integer  "price_reduced"
    t.integer  "discount"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "min"
    t.integer  "max"
    t.integer  "count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "deals_copy", :force => true do |t|
    t.boolean  "is_active"
    t.boolean  "is_running"
    t.string   "product_type"
    t.string   "title"
    t.text     "descritpion"
    t.integer  "price_original"
    t.integer  "price_reduced"
    t.integer  "discount"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "min"
    t.integer  "max"
    t.integer  "count"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "line_items", :force => true do |t|
    t.integer  "order_id"
    t.integer  "deal_id"
    t.integer  "quantity"
    t.string   "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "line_items", ["deal_id"], :name => "index_line_items_on_deal_id"
  add_index "line_items", ["order_id"], :name => "index_line_items_on_order_id"

  create_table "orders", :force => true do |t|
    t.string   "ip"
    t.string   "session_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "payments", :force => true do |t|
    t.integer  "order_id"
    t.string   "paypal_transaction_id"
    t.string   "token"
    t.integer  "price"
    t.string   "email"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "middelname"
    t.string   "company"
    t.string   "address1"
    t.string   "address2"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.datetime "confirmed_at"
    t.datetime "completed_at"
    t.string   "response_params"
    t.text     "ipn_data"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
  end

end
