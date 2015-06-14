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

ActiveRecord::Schema.define(version: 20150608052910) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "completions", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "mission_id"
    t.integer  "repo_id"
    t.string   "commit"
    t.string   "filename"
    t.integer  "line_start"
    t.integer  "line_end"
    t.string   "gist_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "completions", ["mission_id"], name: "index_completions_on_mission_id", using: :btree
  add_index "completions", ["repo_id"], name: "index_completions_on_repo_id", using: :btree
  add_index "completions", ["user_id"], name: "index_completions_on_user_id", using: :btree

  create_table "missions", force: :cascade do |t|
    t.text     "name"
    t.text     "summary"
    t.text     "found_in"
    t.text     "documentation_url"
    t.string   "version_added"
    t.string   "version_removed"
    t.integer  "version"
    t.integer  "tool_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "missions", ["tool_id"], name: "index_missions_on_tool_id", using: :btree

  create_table "repos", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "repos_tools", force: :cascade do |t|
    t.integer "repo_id"
    t.integer "tool_id"
  end

  create_table "repos_users", force: :cascade do |t|
    t.integer "repo_id"
    t.integer "user_id"
  end

  create_table "tools", force: :cascade do |t|
    t.string   "name"
    t.string   "primary_color"
    t.string   "secondary_color"
    t.text     "description"
    t.text     "url"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.text     "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "completions", "missions"
  add_foreign_key "completions", "repos"
  add_foreign_key "completions", "users"
  add_foreign_key "missions", "tools"
end
