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

ActiveRecord::Schema.define(version: 20140523001309) do

  create_table "days", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "days", ["title"], name: "index_days_on_title", unique: true

  create_table "hacks", force: true do |t|
    t.string   "creator"
    t.string   "title"
    t.integer  "day_id"
    t.integer  "votes",      default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hacks", ["day_id"], name: "index_hacks_on_day_id"

end
