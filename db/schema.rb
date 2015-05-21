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

ActiveRecord::Schema.define(version: 20150216034801) do

  create_table "accounts", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "role",       limit: 255
    t.string   "full_name",  limit: 255
    t.string   "tel",        limit: 255
    t.date     "birthday"
    t.string   "address",    limit: 255
    t.boolean  "gender",     limit: 1
    t.string   "image",      limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "admins", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.boolean  "is_delete",              limit: 1
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "advs", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "image",      limit: 255
    t.string   "link",       limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "articles", force: :cascade do |t|
    t.string   "title",       limit: 255
    t.string   "description", limit: 255
    t.string   "detail",      limit: 255
    t.string   "image",       limit: 255
    t.boolean  "is_delete",   limit: 1
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "banners", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "image",      limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "brands", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.boolean  "is_delete",  limit: 1
    t.integer  "parent_id",  limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  # create_table "comments", force: :cascade do |t|
  #   t.string   "content",    limit: 255
  #   t.boolean  "is_delete",  limit: 1
  #   t.boolean  "is_show",    limit: 1
  #   t.integer  "product_id", limit: 4
  #   t.integer  "account_id", limit: 4
  #   t.datetime "created_at",             null: false
  #   t.datetime "updated_at",             null: false
  # end

  add_index "comments", ["account_id"], name: "index_comments_on_account_id", using: :btree
  add_index "comments", ["product_id"], name: "index_comments_on_product_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.string   "mail",          limit: 255
    t.string   "phone",         limit: 255
    t.string   "content_send",  limit: 255
    t.boolean  "status",        limit: 1
    t.string   "reply_title",   limit: 255
    t.string   "content_reply", limit: 255
    t.boolean  "is_delete",     limit: 1
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "images", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "image",      limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "orders", force: :cascade do |t|
    t.boolean  "active_status", limit: 1
    t.boolean  "pay_status",    limit: 1
    t.boolean  "ship_status",   limit: 1
    t.string   "pay_type",      limit: 255
    t.integer  "amount",        limit: 4
    t.datetime "ship_at"
    t.boolean  "is_delete",     limit: 1
    t.integer  "account_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "orders", ["account_id"], name: "index_orders_on_account_id", using: :btree

  create_table "orders_details", force: :cascade do |t|
    t.integer  "price",      limit: 4
    t.integer  "quantity",   limit: 4
    t.boolean  "is_delete",  limit: 1
    t.integer  "order_id",   limit: 4
    t.integer  "product_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "orders_details", ["order_id"], name: "index_orders_details_on_order_id", using: :btree
  add_index "orders_details", ["product_id"], name: "index_orders_details_on_product_id", using: :btree

  create_table "posts", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "kind",       limit: 255
    t.string   "detail",     limit: 255
    t.string   "note",       limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "product_images", force: :cascade do |t|
    t.string   "image",      limit: 255
    t.boolean  "is_delete",  limit: 1
    t.integer  "product_id", limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "product_images", ["product_id"], name: "index_product_images_on_product_id", using: :btree

  create_table "products", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "serial",      limit: 255
    t.integer  "height",      limit: 4
    t.text     "detail",      limit: 65535
    t.integer  "price",       limit: 4
    t.integer  "sale_off",    limit: 4
    t.integer  "quantity",    limit: 4
    t.integer  "discount",    limit: 4
    t.boolean  "is_delete",   limit: 1
    t.integer  "category_id", limit: 4
    t.integer  "brand_id",    limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "products", ["brand_id"], name: "index_products_on_brand_id", using: :btree
  add_index "products", ["category_id"], name: "index_products_on_category_id", using: :btree

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating",     limit: 4
    t.boolean  "is_delete",  limit: 1
    t.integer  "product_id", limit: 4
    t.integer  "account_id", limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "ratings", ["account_id"], name: "index_ratings_on_account_id", using: :btree
  add_index "ratings", ["product_id"], name: "index_ratings_on_product_id", using: :btree

  create_table "sliders", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "image",      limit: 255
    t.boolean  "is_delete",  limit: 1
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  # create_table "users", force: :cascade do |t|
  #   t.string   "provider",   limit: 255
  #   t.string   "uid",        limit: 255
  #   t.string   "name",       limit: 255
  #   t.datetime "created_at",             null: false
  #   t.datetime "updated_at",             null: false
  # end

end
