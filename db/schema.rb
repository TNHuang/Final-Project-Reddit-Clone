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

ActiveRecord::Schema.define(version: 20141029145356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: true do |t|
    t.integer  "author_id",         null: false
    t.integer  "parent_comment_id"
    t.text     "body",              null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "post_id",           null: false
  end

  add_index "comments", ["author_id"], name: "index_comments_on_author_id", using: :btree
  add_index "comments", ["parent_comment_id"], name: "index_comments_on_parent_comment_id", using: :btree
  add_index "comments", ["post_id"], name: "index_comments_on_post_id", using: :btree

  create_table "moddings", force: true do |t|
    t.integer  "moderator_id", null: false
    t.integer  "sub_id",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "moddings", ["moderator_id", "sub_id"], name: "index_moddings_on_moderator_id_and_sub_id", unique: true, using: :btree

  create_table "postings", force: true do |t|
    t.integer  "sub_id",     null: false
    t.integer  "post_id",    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "postings", ["post_id", "sub_id"], name: "index_postings_on_post_id_and_sub_id", unique: true, using: :btree

  create_table "posts", force: true do |t|
    t.string   "title",      null: false
    t.string   "url"
    t.string   "body"
    t.integer  "author_id",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["author_id"], name: "index_posts_on_author_id", using: :btree
  add_index "posts", ["title"], name: "index_posts_on_title", using: :btree

  create_table "sign_ins", force: true do |t|
    t.integer  "user_id",       null: false
    t.string   "session_token", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sign_ins", ["session_token"], name: "index_sign_ins_on_session_token", unique: true, using: :btree
  add_index "sign_ins", ["user_id"], name: "index_sign_ins_on_user_id", using: :btree

  create_table "subs", force: true do |t|
    t.string   "name",        null: false
    t.string   "title",       null: false
    t.text     "description", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subs", ["name"], name: "index_subs_on_name", unique: true, using: :btree
  add_index "subs", ["title"], name: "index_subs_on_title", unique: true, using: :btree

  create_table "subscriptions", force: true do |t|
    t.integer  "subscriber_id", null: false
    t.integer  "sub_id",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["subscriber_id", "sub_id"], name: "index_subscriptions_on_subscriber_id_and_sub_id", unique: true, using: :btree

  create_table "user_votes", force: true do |t|
    t.integer  "user_id",      null: false
    t.integer  "votable_id",   null: false
    t.string   "votable_type", null: false
    t.integer  "value",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_votes", ["votable_id", "votable_type", "user_id"], name: "index_user_votes_on_votable_id_and_votable_type_and_user_id", unique: true, using: :btree
  add_index "user_votes", ["votable_id", "votable_type"], name: "index_user_votes_on_votable_id_and_votable_type", using: :btree

  create_table "users", force: true do |t|
    t.string   "name",            null: false
    t.string   "password_digest", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree

end
