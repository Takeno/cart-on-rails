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

ActiveRecord::Schema.define(version: 20140615153031) do

  create_table "addresses", force: true do |t|
    t.string   "street"
    t.string   "city"
    t.string   "state"
    t.string   "nation"
    t.string   "zipcode"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "cart_items", force: true do |t|
    t.integer  "quantity"
    t.integer  "product_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cart_items", ["customer_id"], name: "index_cart_items_on_customer_id"
  add_index "cart_items", ["product_id"], name: "index_cart_items_on_product_id"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "surname"
    t.date     "birthdate"
    t.string   "nickname"
    t.string   "password"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "customers", ["address_id"], name: "index_customers_on_address_id"

  create_table "order_lines", force: true do |t|
    t.integer  "quantity"
    t.float    "unitPrice"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_id"
    t.integer  "product_id"
  end

  add_index "order_lines", ["order_id"], name: "index_order_lines_on_order_id"
  add_index "order_lines", ["product_id"], name: "index_order_lines_on_product_id"

  create_table "orders", force: true do |t|
    t.boolean  "evaded"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "customer_id"
  end

  add_index "orders", ["customer_id"], name: "index_orders_on_customer_id"

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "description"
    t.float    "price"
    t.integer  "quantity"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "providers", force: true do |t|
    t.string   "name"
    t.string   "vat"
    t.integer  "address_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "providers", ["address_id"], name: "index_providers_on_address_id"

  create_table "providers_products", id: false, force: true do |t|
    t.integer "providers_id"
    t.integer "products_id"
  end

end
