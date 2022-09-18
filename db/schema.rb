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

ActiveRecord::Schema[7.0].define(version: 2022_09_18_072144) do
  create_table "cars", force: :cascade do |t|
    t.string "licence"
    t.string "vin"
    t.string "mileage"
    t.integer "ecm_id", null: false
    t.integer "sum"
    t.integer "model_id", null: false
    t.integer "make_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["client_id"], name: "index_cars_on_client_id"
    t.index ["ecm_id"], name: "index_cars_on_ecm_id"
    t.index ["licence"], name: "index_cars_on_licence"
    t.index ["make_id"], name: "index_cars_on_make_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "licence"
    t.string "name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ecms", force: :cascade do |t|
    t.text "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ecms_on_name"
  end

  create_table "makes", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade do |t|
    t.string "name"
    t.integer "make_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["make_id"], name: "index_models_on_make_id"
  end

  create_table "orders", force: :cascade do |t|
    t.text "problem"
    t.text "work_description"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "client_id", null: false
    t.boolean "status", default: false
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "cars", "clients"
  add_foreign_key "cars", "ecms"
  add_foreign_key "cars", "makes"
  add_foreign_key "cars", "models"
  add_foreign_key "models", "makes"
  add_foreign_key "orders", "clients"
end
