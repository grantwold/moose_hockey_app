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

ActiveRecord::Schema.define(:version => 20131108123320) do

  create_table "games", :force => true do |t|
    t.integer  "player_id"
    t.integer  "season_id"
    t.integer  "statistic_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "memberships", :force => true do |t|
    t.integer  "player_id"
    t.integer  "season_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "players", :force => true do |t|
    t.integer  "number"
    t.integer  "gamesplayed"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
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

  create_table "statistics", :force => true do |t|
    t.integer  "goals"
    t.integer  "assists"
    t.integer  "shorthandedgoals"
    t.integer  "powerplaygoals"
    t.integer  "penalties"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.integer  "games_id"
  end

end
