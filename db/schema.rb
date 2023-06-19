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

ActiveRecord::Schema[7.0].define(version: 2023_06_19_174023) do
  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "articles", force: :cascade do |t|
    t.string "name"
    t.text "title"
    t.text "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "brand_ecus", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "cars", force: :cascade do |t|
    t.string "licence"
    t.string "vin"
    t.decimal "mileage"
    t.integer "sum"
    t.integer "model_id", null: false
    t.integer "make_id", null: false
    t.integer "client_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "brand_ecu_id"
    t.integer "model_ecu_id"
    t.integer "soft_ecu_id"
    t.integer "sw_ident_id"
    t.index ["client_id"], name: "index_cars_on_client_id"
    t.index ["licence"], name: "index_cars_on_licence"
    t.index ["make_id"], name: "index_cars_on_make_id"
    t.index ["model_id"], name: "index_cars_on_model_id"
    t.index ["sw_ident_id"], name: "index_cars_on_sw_ident_id"
  end

  create_table "chats", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string "licence"
    t.string "name"
    t.string "username"
    t.string "phone"
    t.date "data", default: "2022-10-21"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", force: :cascade do |t|
    t.string "author"
    t.text "body"
    t.integer "articles_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["articles_id"], name: "index_comments_on_articles_id"
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

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "chat_id", null: false
    t.text "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chat_id"], name: "index_messages_on_chat_id"
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "model_ecus", force: :cascade do |t|
    t.string "name"
    t.integer "brand_ecu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["brand_ecu_id"], name: "index_model_ecus_on_brand_ecu_id"
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
    t.string "image"
    t.integer "mileage", default: 0
    t.index ["client_id"], name: "index_orders_on_client_id"
  end

  create_table "soft_ecus", force: :cascade do |t|
    t.string "name"
    t.integer "model_ecu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["model_ecu_id"], name: "index_soft_ecus_on_model_ecu_id"
  end

  create_table "sw_idents", force: :cascade do |t|
    t.string "name"
    t.integer "soft_ecu_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["soft_ecu_id"], name: "index_sw_idents_on_soft_ecu_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.boolean "status"
    t.date "date"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "email"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "cars", "brand_ecus"
  add_foreign_key "cars", "clients"
  add_foreign_key "cars", "makes"
  add_foreign_key "cars", "model_ecus"
  add_foreign_key "cars", "models"
  add_foreign_key "cars", "soft_ecus"
  add_foreign_key "cars", "sw_idents"
  add_foreign_key "comments", "articles", column: "articles_id"
  add_foreign_key "messages", "chats"
  add_foreign_key "messages", "users"
  add_foreign_key "model_ecus", "brand_ecus"
  add_foreign_key "models", "makes"
  add_foreign_key "orders", "clients"
  add_foreign_key "soft_ecus", "model_ecus"
  add_foreign_key "sw_idents", "soft_ecus"
  add_foreign_key "tasks", "users"
end
