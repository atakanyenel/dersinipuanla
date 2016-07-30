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

ActiveRecord::Schema.define(version: 0) do

  create_table "comments", force: true do |t|
    t.integer  "course_id",              null: false
    t.text     "text",                   null: false
    t.integer  "point",                  null: false
    t.string   "user_id",    limit: 30, null: false
    t.datetime "created_at",             null: false
  end

  create_table "courses", force: true do |t|
    t.string  "name",          limit: 15, null: false
    t.integer "university_id",            null: false
  end

  add_index "courses", ["id"], name: "id", using: :btree

  create_table "universities", force: true do |t|
    t.string "name", limit: 80, null: false
    t.string "mail", limit: 30, null: false
  end

  create_table "users", force: true, id: false do |t|
    t.string  "name",          limit: 30, null: false
    t.string  "email",         limit: 60, null: false
    t.integer "university_id",            null: false
    t.string  "id",          limit: 30, null: false
  end

end
