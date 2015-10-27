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

ActiveRecord::Schema.define(version: 20151027230108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.string   "content"
    t.string   "stage"
    t.integer  "commenter_id"
    t.integer  "experiment_id"
    t.integer  "proposal_id"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "comments", ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id", using: :btree

  create_table "experiments", force: :cascade do |t|
    t.string   "description"
    t.string   "equipment"
    t.string   "procedure"
    t.string   "observations"
    t.string   "results"
    t.string   "conclusion"
    t.integer  "researcher_id"
    t.integer  "proposal_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
  end

  create_table "observations", force: :cascade do |t|
    t.string   "content"
    t.integer  "researcher_id"
    t.integer  "experiment_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "proposals", force: :cascade do |t|
    t.string   "title"
    t.string   "summary"
    t.string   "hypothesis"
    t.string   "department"
    t.integer  "active"
    t.integer  "faculty_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
