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
