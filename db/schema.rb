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

ActiveRecord::Schema.define(version: 20140829172722) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bills", force: true do |t|
    t.string   "bill_id"
    t.string   "number"
    t.string   "congress"
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
    t.integer  "congress_house_id"
  end

  add_index "bills", ["bill_id"], name: "index_bills_on_bill_id", unique: true, using: :btree

  create_table "congress_houses", primary_key: "congress_house_id", force: true do |t|
    t.text "congress_house", null: false
  end

  add_index "congress_houses", ["congress_house"], name: "congress_houses__u_congress_house", unique: true, using: :btree

  create_table "leadership_roles", primary_key: "leadership_role_id", force: true do |t|
    t.text "leadership_role", null: false
  end

  add_index "leadership_roles", ["leadership_role"], name: "leadership_roles__u_leadership_role", unique: true, using: :btree

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
    t.string  "contact_form"
    t.string  "district"
    t.string  "gender"
    t.string  "office"
    t.string  "state"
    t.string  "state_name"
    t.string  "website"
    t.integer "congress_house_id"
    t.integer "party_id"
    t.integer "leadership_role_id"
  end

  add_index "legislators", ["bioguide_id"], name: "index_legislators_on_bioguide_id", unique: true, using: :btree

  create_table "parties", primary_key: "party_id", force: true do |t|
    t.text "party", null: false
  end

  add_index "parties", ["party"], name: "parties__u_party", unique: true, using: :btree

  create_table "tag_types", primary_key: "tag_type_id", force: true do |t|
    t.text "tag_type", null: false
  end

  add_index "tag_types", ["tag_type"], name: "tag_types__u_tag_type", unique: true, using: :btree

  create_table "tags", force: true do |t|
    t.integer "users_id"
    t.integer "tag_type_id"
  end

  create_table "title_types", primary_key: "title_type_id", force: true do |t|
    t.text "title_type", null: false
  end

  add_index "title_types", ["title_type"], name: "title_types__u_title_type", unique: true, using: :btree

  create_table "titles", force: true do |t|
    t.integer "bills_id"
    t.text    "title"
    t.integer "title_type_id"
  end

  create_table "users", force: true do |t|
    t.string "email",      null: false
    t.string "password",   null: false
    t.string "first_name", null: false
    t.string "last_name",  null: false
  end

end
