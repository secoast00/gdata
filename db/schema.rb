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

ActiveRecord::Schema.define(version: 20150317202626) do

  create_table "actors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "events", force: true do |t|
    t.string   "github_id"
    t.string   "category"
    t.integer  "actor_id"
    t.string   "repo"
    t.text     "data"
    t.datetime "github_created_at", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "events", ["actor_id"], name: "index_events_on_actor_id"
  add_index "events", ["github_id"], name: "index_events_on_github_id", unique: true

end
