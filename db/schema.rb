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

ActiveRecord::Schema[8.0].define(version: 2025_02_05_124758) do
  create_table "books", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.decimal "price"
    t.text "description"
    t.integer "stock"
    t.string "cover_image_url"
    t.integer "category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_books_on_category_id"
  end

  create_table "cart_items", force: :cascade do |t|
    t.integer "cart_id", null: false
    t.integer "book_id", null: false
    t.integer "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_cart_items_on_book_id"
    t.index ["cart_id"], name: "index_cart_items_on_cart_id"
  end

  create_table "carts", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_carts_on_user_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_items", force: :cascade do |t|
    t.integer "order_id", null: false
    t.integer "book_id", null: false
    t.integer "quantity"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_order_items_on_book_id"
    t.index ["order_id"], name: "index_order_items_on_order_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "user_id", null: false
    t.decimal "total_price"
    t.string "status"
    t.string "payment_status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "order_id", null: false
    t.decimal "amount"
    t.string "payment_method"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_payments_on_order_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.integer "rating"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "role"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_wishlists_on_book_id"
    t.index ["user_id"], name: "index_wishlists_on_user_id"
  end

  add_foreign_key "books", "categories"
  add_foreign_key "cart_items", "books"
  add_foreign_key "cart_items", "carts"
  add_foreign_key "carts", "users"
  add_foreign_key "order_items", "books"
  add_foreign_key "order_items", "orders"
  add_foreign_key "orders", "users"
  add_foreign_key "payments", "orders"
  add_foreign_key "reviews", "books"
  add_foreign_key "reviews", "users"
  add_foreign_key "wishlists", "books"
  add_foreign_key "wishlists", "users"
end
