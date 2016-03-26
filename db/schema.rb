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

ActiveRecord::Schema.define(version: 20150208024405) do

  create_table "articles", force: :cascade do |t|
    t.string   "title",         limit: 255,                  null: false
    t.text     "content",       limit: 65535
    t.integer  "views",         limit: 4,     default: 0,    null: false
    t.boolean  "enable",        limit: 1,     default: true, null: false
    t.integer  "comment_count", limit: 4,     default: 0,    null: false
    t.integer  "user_id",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "content",    limit: 6000,                null: false
    t.boolean  "enable",     limit: 1,    default: true, null: false
    t.integer  "layer",      limit: 4,    default: 1,    null: false
    t.string   "name",       limit: 255
    t.string   "ip",         limit: 255
    t.integer  "article_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "username",           limit: 255,             null: false
    t.string   "name",               limit: 255
    t.string   "encrypted_password", limit: 255,             null: false
    t.string   "email",              limit: 255
    t.string   "salt",               limit: 255
    t.integer  "gender",             limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
