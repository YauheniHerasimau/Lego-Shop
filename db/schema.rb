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

ActiveRecord::Schema[8.0].define(version: 2025_01_31_225548) do
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

  create_table "admin_responses", force: :cascade do |t|
    t.integer "opinion_id", null: false
    t.integer "user_id", null: false
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["opinion_id"], name: "index_admin_responses_on_opinion_id"
    t.index ["user_id"], name: "index_admin_responses_on_user_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "lego_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
    t.index ["lego_id"], name: "index_cart_items_on_lego_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories_legos", id: false, force: :cascade do |t|
    t.integer "category_id", null: false
    t.integer "lego_id", null: false
    t.index ["category_id", "lego_id"], name: "index_categories_legos_on_category_id_and_lego_id"
    t.index ["lego_id", "category_id"], name: "index_categories_legos_on_lego_id_and_category_id"
  end

  create_table "catr_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "quatity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id"], name: "index_catr_items_on_cart_id"
  end

  create_table "create_admin_message_responses", force: :cascade do |t|
    t.integer "message_id", null: false
    t.integer "admin_id", null: false
    t.text "response_content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_create_admin_message_responses_on_admin_id"
    t.index ["message_id"], name: "index_create_admin_message_responses_on_message_id"
  end

  create_table "create_messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "subject"
    t.text "content", null: false
    t.boolean "read", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_create_messages_on_user_id"
  end

  create_table "lego_categories", force: :cascade do |t|
    t.integer "lego_id", null: false
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_lego_categories_on_category_id"
    t.index ["lego_id", "category_id"], name: "index_lego_categories_on_lego_id_and_category_id", unique: true
    t.index ["lego_id"], name: "index_lego_categories_on_lego_id"
  end

  create_table "legos", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "lego_set"
    t.string "image_url"
    t.integer "details"
    t.decimal "price", precision: 10, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "link"
    t.boolean "hiden"
    t.boolean "hidden", default: false
  end

  create_table "messages", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "subject"
    t.text "content"
    t.boolean "read"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "opinions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lego_id", null: false
    t.integer "rating", null: false
    t.text "comment", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lego_id"], name: "index_opinions_on_lego_id"
    t.index ["user_id", "lego_id"], name: "index_opinions_on_user_id_and_lego_id", unique: true
    t.index ["user_id"], name: "index_opinions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.boolean "banned"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "admin_responses", "opinions"
  add_foreign_key "admin_responses", "users"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "cart_items", "legos"
  add_foreign_key "carts", "users"
  add_foreign_key "catr_items", "carts"
  add_foreign_key "create_admin_message_responses", "admins"
  add_foreign_key "create_admin_message_responses", "messages"
  add_foreign_key "create_messages", "users"
  add_foreign_key "lego_categories", "categories"
  add_foreign_key "lego_categories", "legos"
  add_foreign_key "messages", "users"
  add_foreign_key "opinions", "legos"
  add_foreign_key "opinions", "users"
end
