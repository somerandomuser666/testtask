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

ActiveRecord::Schema.define(version: 20181007134450) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups_teams", id: false, force: :cascade do |t|
    t.bigint "team_id", null: false
    t.bigint "group_id", null: false
    t.index ["group_id", "team_id"], name: "index_groups_teams_on_group_id_and_team_id"
    t.index ["team_id", "group_id"], name: "index_groups_teams_on_team_id_and_group_id"
  end

  create_table "matches", force: :cascade do |t|
    t.bigint "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_matches_on_group_id"
  end

  create_table "team_scores", force: :cascade do |t|
    t.bigint "match_id"
    t.bigint "team_id"
    t.integer "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["match_id"], name: "index_team_scores_on_match_id"
    t.index ["team_id"], name: "index_team_scores_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "team_scores", "matches"
  add_foreign_key "team_scores", "teams"
end
