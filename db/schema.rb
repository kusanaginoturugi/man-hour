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

ActiveRecord::Schema.define(version: 20150310024358) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "job_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "jobs", force: true do |t|
    t.integer  "job_type_id"
    t.string   "title"
    t.text     "detail"
    t.integer  "cost"
    t.string   "place"
    t.datetime "begin_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float    "worktime"
    t.boolean  "outside_budget"
  end

  create_table "monthly_summaries", force: true do |t|
    t.integer  "year"
    t.integer  "month"
    t.datetime "begin_at"
    t.datetime "end_at"
    t.float    "carryover_amount"
    t.float    "this_month_amount"
    t.float    "amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
