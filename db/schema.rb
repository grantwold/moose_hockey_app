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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131216225627) do

  create_table "games", :force => true do |t|
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
    t.string   "location"
    t.string   "opponent"
    t.boolean  "official"
    t.time     "time"
    t.date     "date"
    t.boolean  "scrimmage"
    t.boolean  "practice"
    t.integer  "moose_goals"
    t.integer  "opponent_goals"
    t.integer  "moose_assists"
    t.integer  "opponent_assists"
    t.integer  "moose_shg"
    t.integer  "opponent_shg"
    t.integer  "moose_ppg"
    t.integer  "opponent_ppg"
    t.integer  "moose_penalties"
    t.integer  "opponent_penalties"
    t.integer  "opponents_shots_on_goal"
    t.integer  "moose_shots_on_goal"
  end

  create_table "games_seasons", :force => true do |t|
    t.integer "game_id"
    t.integer "season_id"
  end

  create_table "memberships", :force => true do |t|
    t.integer  "player_id"
    t.integer  "game_id"
    t.integer  "season_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "number"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "position"
    t.string   "name"
  end

  create_table "seasons", :force => true do |t|
    t.string   "name"
    t.date     "season_start"
    t.date     "season_end"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

end
