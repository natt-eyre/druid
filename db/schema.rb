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

ActiveRecord::Schema.define(version: 20151129145944) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree

  create_table "issues", force: :cascade do |t|
    t.string   "title",                   null: false
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "status",      default: 0
    t.integer  "project_id"
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree
  add_index "issues", ["user_id"], name: "index_issues_on_user_id", using: :btree

  create_table "issues_tags", id: false, force: :cascade do |t|
    t.integer "issue_id"
    t.integer "tag_id"
  end

  add_index "issues_tags", ["issue_id"], name: "index_issues_tags_on_issue_id", using: :btree
  add_index "issues_tags", ["tag_id"], name: "index_issues_tags_on_tag_id", using: :btree

  create_table "projects", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects_users", id: false, force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
  end

  add_index "projects_users", ["project_id"], name: "index_projects_users_on_project_id", using: :btree
  add_index "projects_users", ["user_id"], name: "index_projects_users_on_user_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "color"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "tags", ["project_id"], name: "index_tags_on_project_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.string   "email",                          null: false
    t.string   "encrypted_password", limit: 128, null: false
    t.string   "confirmation_token", limit: 128
    t.string   "remember_token",     limit: 128, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree
  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

  add_foreign_key "issues", "projects"
  add_foreign_key "issues", "users"
  add_foreign_key "tags", "projects"
end
