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

ActiveRecord::Schema.define(version: 20140827215005) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "bill_id"
    t.string   "bill_type"
    t.string   "number"
    t.string   "congress"
    t.string   "chamber"
    t.text     "official_title"
    t.string   "popular_title"
    t.string   "short_title"
    t.boolean  "history_active"
    t.boolean  "history_awaiting_signature"
    t.boolean  "history_enacted"
    t.boolean  "history_vetoed"
    t.datetime "introduced_on"
    t.datetime "last_action_at"
    t.datetime "last_version_on"
    t.datetime "last_vote_at"
    t.string   "sponsor_id"
    t.integer  "cosponsors_count"
    t.string   "withdrawn_cosponsors_count"
    t.integer  "legislators_id"
  end

  add_index "bills", ["bill_id"], name: "index_bills_on_bill_id", unique: true, using: :btree

  create_table "legislators", force: true do |t|
    t.string  "bioguide_id"
    t.string  "title"
    t.string  "first_name"
    t.string  "middle_name"
    t.string  "last_name"
    t.string  "name_suffix"
    t.string  "nickname"
    t.boolean "in_office"
    t.date    "birthday"
    t.date    "term_end"
    t.date    "term_start"
    t.string  "chamber"
    t.string  "contact_form"
    t.string  "district"
    t.string  "gender"
    t.string  "leadership_role"
    t.string  "office"
    t.string  "party"
    t.string  "state"
    t.string  "state_name"
    t.string  "website"
  end

  add_index "legislators", ["bioguide_id"], name: "index_legislators_on_bioguide_id", unique: true, using: :btree

end
