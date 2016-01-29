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

ActiveRecord::Schema.define(version: 20160129214026) do

  create_table "games", force: :cascade do |t|
    t.integer  "winner_score"
    t.integer  "loser_score"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "winner_slack"
    t.string   "loser_slack"
    t.integer  "winner_id"
    t.integer  "loser_id"
  end

  create_table "players", force: :cascade do |t|
    t.integer  "games_played"
    t.integer  "wins"
    t.integer  "losses"
    t.integer  "rating"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "slack_handle"
    t.string   "display_name"
  end

  create_table "provisional_ratings", force: :cascade do |t|
    t.integer  "provisional_rating"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "player_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "rating"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "player_id"
  end

end
