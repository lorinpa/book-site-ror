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

ActiveRecord::Schema.define(version: 20130730163056) do

  create_table "authors", force: true do |t|
    t.string   "first_name", limit: 25, null: false
    t.string   "last_name",  limit: 25, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authors", ["first_name", "last_name"], name: "unique_author_name", unique: true

  create_table "book_categories", force: true do |t|
    t.integer  "book_id",     null: false
    t.integer  "category_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "book_categories", ["book_id", "category_id"], name: "unique_book_category", unique: true

  create_table "books", force: true do |t|
    t.string   "title",      limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "author_id",             null: false
  end

  add_index "books", ["title", "author_id"], name: "unique_book", unique: true

  create_table "categories", force: true do |t|
    t.string   "title",      limit: 50, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories", ["title"], name: "unique_category", unique: true

  create_table "reviews", force: true do |t|
    t.integer  "stars",      default: 0, null: false
    t.text     "body",                   null: false
    t.integer  "book_id",                null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
