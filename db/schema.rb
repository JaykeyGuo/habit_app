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

ActiveRecord::Schema.define(version: 20170408125916) do

  create_table "habit_lists", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "habit_type_id"
  end

  create_table "habit_periods", force: :cascade do |t|
    t.string   "period_type"
    t.integer  "period_time"
    t.text     "period_method"
    t.integer  "habit_list_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "habit_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "record_days", force: :cascade do |t|
    t.integer  "day_num"
    t.text     "record_content"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "habit_list_id"
    t.string   "keyword"
    t.datetime "complete_at"
  end

end
