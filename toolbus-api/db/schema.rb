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

ActiveRecord::Schema.define(version: 20150608060009) do

  create_table "achievements", force: :cascade do |t|
    t.text     "name",              limit: 65535
    t.text     "summary",           limit: 65535
    t.text     "found_in",          limit: 65535
    t.text     "documentation_url", limit: 65535
    t.string   "version_added",     limit: 255
    t.string   "version_removed",   limit: 255
    t.integer  "version",           limit: 4
    t.integer  "user_id",           limit: 4
    t.integer  "tool_id",           limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "achievements", ["tool_id"], name: "index_achievements_on_tool_id", using: :btree
  add_index "achievements", ["user_id"], name: "index_achievements_on_user_id", using: :btree

  create_table "completions", force: :cascade do |t|
    t.integer  "achievement_id", limit: 4
    t.integer  "repo_id",        limit: 4
    t.string   "commit",         limit: 255
    t.string   "filename",       limit: 255
    t.integer  "line_start",     limit: 4
    t.integer  "line_end",       limit: 4
    t.string   "gist_url",       limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "completions", ["achievement_id"], name: "index_completions_on_achievement_id", using: :btree
  add_index "completions", ["repo_id"], name: "index_completions_on_repo_id", using: :btree

  create_table "repos", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "repos", ["user_id"], name: "index_repos_on_user_id", using: :btree

  create_table "repos_tools", force: :cascade do |t|
    t.integer "repo_id", limit: 4
    t.integer "tool_id", limit: 4
  end

  create_table "repos_users", force: :cascade do |t|
    t.integer "repo_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "tools", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "primary_color",   limit: 255
    t.string   "secondary_color", limit: 255
    t.text     "description",     limit: 65535
    t.text     "url",             limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  create_table "tools_users", force: :cascade do |t|
    t.integer "tool_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",   limit: 255
    t.text     "image_url",  limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_foreign_key "achievements", "tools"
  add_foreign_key "achievements", "users"
  add_foreign_key "completions", "achievements"
  add_foreign_key "completions", "repos"
  add_foreign_key "repos", "users"
end
