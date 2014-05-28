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

ActiveRecord::Schema.define(version: 20140528040831) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "debaters", force: true do |t|
    t.string   "name"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "judges", force: true do |t|
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairing_members", force: true do |t|
    t.integer  "pairing_id"
    t.integer  "team_id"
    t.integer  "side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pairings", force: true do |t|
    t.integer  "round_id"
    t.integer  "side"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ranks", force: true do |t|
    t.integer  "result_id"
    t.integer  "debater_id"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "registrations", force: true do |t|
    t.integer  "tournament_id"
    t.integer  "registerable_id"
    t.string   "registerable_type"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "results", force: true do |t|
    t.integer  "pairing_id"
    t.integer  "type"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rounds", force: true do |t|
    t.integer  "round_number"
    t.integer  "tournament_id"
    t.boolean  "outround"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "school_affiliations", force: true do |t|
    t.integer  "school_id"
    t.integer  "affiliatable_id"
    t.string   "affiliatable_type"
    t.integer  "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", force: true do |t|
    t.integer  "name"
    t.integer  "affiliations_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scratches", force: true do |t|
    t.integer  "judge_id"
    t.integer  "team_id"
    t.boolean  "affiliation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "seeds", force: true do |t|
    t.integer  "debater_id"
    t.integer  "seed_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "speaker_points", force: true do |t|
    t.integer  "result_id"
    t.integer  "debater_id"
    t.integer  "speaker_points"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.integer  "wins"
    t.integer  "losses"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tournaments", force: true do |t|
    t.datetime "date"
    t.integer  "user_id"
    t.integer  "host_school_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.string   "token"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
