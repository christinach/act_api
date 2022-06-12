# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_06_12_164719) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "locations", force: :cascade do |t|
    t.string "country", null: false
    t.string "city", null: false
    t.string "state"
    t.string "zip_code", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "unit"
    t.integer "cost"
    t.integer "tax"
    t.string "vendor", null: false
    t.integer "total_cost"
    t.datetime "date_of_order", precision: nil
    t.datetime "date_of_arrival", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "products_purchase_orders", id: false, force: :cascade do |t|
    t.bigint "products_id"
    t.bigint "purchase_orders_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["products_id"], name: "index_products_purchase_orders_on_products_id"
    t.index ["purchase_orders_id"], name: "index_products_purchase_orders_on_purchase_orders_id"
  end

  create_table "purchase_order_categories", force: :cascade do |t|
    t.string "category", null: false
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.string "status", null: false
    t.bigint "purchase_order_categories_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchase_order_categories_id"], name: "index_purchase_orders_on_purchase_order_categories_id"
  end

  create_table "stores", force: :cascade do |t|
    t.string "name"
    t.bigint "locations_id"
    t.boolean "franchise", default: false
    t.string "address"
    t.string "phone_number"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address"], name: "index_stores_on_address"
    t.index ["email"], name: "index_stores_on_email"
    t.index ["locations_id"], name: "index_stores_on_locations_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.bigint "locations_id"
    t.boolean "active", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["locations_id"], name: "index_vendors_on_locations_id"
  end

  add_foreign_key "purchase_orders", "purchase_order_categories", column: "purchase_order_categories_id"
  add_foreign_key "stores", "locations", column: "locations_id"
  add_foreign_key "vendors", "locations", column: "locations_id"
end
