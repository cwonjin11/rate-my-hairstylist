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

ActiveRecord::Schema.define(version: 2021_05_09_014843) do

  create_table "stylists", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "shop_name"
    t.string "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "user_stylists", force: :cascade do |t|
    t.date "haircut_date"
    t.integer "stars"
    t.string "comment"
    t.string "services"
    t.float "price"
    t.integer "user_id", null: false
    t.integer "stylist_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["stylist_id"], name: "index_user_stylists_on_stylist_id"
    t.index ["user_id"], name: "index_user_stylists_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
    t.string "uid"
    t.string "provider"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "user_stylists", "stylists"
  add_foreign_key "user_stylists", "users"
end
