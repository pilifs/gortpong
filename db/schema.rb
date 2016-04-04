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

ActiveRecord::Schema.define(version: 20160404163002) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "games", force: :cascade do |t|
    t.integer  "winner_score"
    t.integer  "loser_score"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "winner_slack"
    t.string   "loser_slack"
    t.integer  "winner_id"
    t.integer  "loser_id"
    t.integer  "user_id"
    t.integer  "rating_change"
    t.string   "video_link"
  end

  create_table "live_games", force: :cascade do |t|
    t.string   "player_one_slack"
    t.string   "player_two_slack"
    t.integer  "player_one_score"
    t.integer  "player_two_score"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.string   "table_name"
    t.boolean  "in_progress"
  end

  create_table "player_queues", force: :cascade do |t|
    t.integer  "live_game_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "player_id",    default: [],              array: true
  end

  add_index "player_queues", ["live_game_id"], name: "index_player_queues_on_live_game_id", using: :btree

  create_table "players", force: :cascade do |t|
    t.integer  "games_played"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slack_handle"
    t.string   "display_name"
    t.integer  "plus_minus"
    t.integer  "user_id"
    t.integer  "win_streak"
  end

  create_table "provisional_ratings", force: :cascade do |t|
    t.integer  "provisional_rating"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "player_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "player_id"
    t.integer  "highest_ever"
    t.integer  "avg_opp_rating_win"
    t.integer  "avg_opp_rating_loss"
    t.integer  "avg_opp_rating"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_foreign_key "player_queues", "live_games"
end
