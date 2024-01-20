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

ActiveRecord::Schema[7.0].define(version: 20240120302120340) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_categories_on_category_id"
  end

  create_table "chains", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "currencies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "household_members", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_household_members_on_user_id"
  end

  create_table "packages", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "purchased_item_household_members", force: :cascade do |t|
    t.bigint "purchased_item_id"
    t.bigint "household_member_id"
    t.index ["household_member_id"], name: "index_purchased_item_household_members_on_household_member_id"
    t.index ["purchased_item_id"], name: "index_purchased_item_household_members_on_purchased_item_id"
  end

  create_table "purchased_items", force: :cascade do |t|
    t.bigint "receipt_id", null: false
    t.string "name"
    t.bigint "type_id"
    t.bigint "brand_id"
    t.bigint "category_id", null: false
    t.decimal "paid_price", null: false
    t.decimal "unit_price"
    t.float "unit_number"
    t.bigint "unit_id"
    t.decimal "package_price"
    t.float "package_number"
    t.bigint "package_id"
    t.decimal "package_volume"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_id"], name: "index_purchased_items_on_brand_id"
    t.index ["category_id"], name: "index_purchased_items_on_category_id"
    t.index ["package_id"], name: "index_purchased_items_on_package_id"
    t.index ["receipt_id"], name: "index_purchased_items_on_receipt_id"
    t.index ["type_id"], name: "index_purchased_items_on_type_id"
    t.index ["unit_id"], name: "index_purchased_items_on_unit_id"
  end

  create_table "purchased_items_tags", force: :cascade do |t|
    t.bigint "purchased_item_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["purchased_item_id"], name: "index_purchased_items_tags_on_purchased_item_id"
    t.index ["tag_id"], name: "index_purchased_items_tags_on_tag_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.date "date", null: false
    t.bigint "shop_id", null: false
    t.string "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["shop_id"], name: "index_receipts_on_shop_id"
  end

  create_table "shops", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "chain_id"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chain_id"], name: "index_shops_on_chain_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "units", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "categories", "categories"
  add_foreign_key "household_members", "users"
  add_foreign_key "purchased_item_household_members", "household_members"
  add_foreign_key "purchased_item_household_members", "purchased_items"
  add_foreign_key "purchased_items", "brands"
  add_foreign_key "purchased_items", "categories"
  add_foreign_key "purchased_items", "packages"
  add_foreign_key "purchased_items", "receipts"
  add_foreign_key "purchased_items", "types"
  add_foreign_key "purchased_items", "units"
  add_foreign_key "purchased_items_tags", "purchased_items"
  add_foreign_key "purchased_items_tags", "tags"
  add_foreign_key "receipts", "shops"
  add_foreign_key "shops", "chains"
end
