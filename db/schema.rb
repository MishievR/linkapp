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

ActiveRecord::Schema.define(version: 20170823193643) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.text     "description"
  end

  create_table "category_groups", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "group_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "person_id"
    t.text     "body"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "group_id"
    t.index ["group_id"], name: "index_comments_on_group_id"
    t.index ["person_id"], name: "index_comments_on_person_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string   "title"
    t.string   "tag_line"
    t.string   "group_image"
    t.string   "group_background_image"
    t.integer  "rank",                   default: 0, null: false
    t.text     "description"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.integer  "user_id"
  end

  create_table "interests", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "listing_categories", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "category_id"
  end

  create_table "listing_interests", force: :cascade do |t|
    t.integer "listing_id"
    t.integer "interest_id"
  end

  create_table "people", force: :cascade do |t|
    t.string   "title"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "description"
    t.integer  "user_id"
    t.string   "listing_url"
    t.string   "interest_main"
    t.integer  "rating"
    t.integer  "price"
    t.boolean  "smoke"
    t.boolean  "pets"
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer  "accomodate"
    t.integer  "bedroom"
    t.integer  "companions",        default: 1
    t.string   "price_time"
    t.text     "tag_line"
    t.string   "twitter_url"
    t.string   "facebook_url"
    t.string   "linkedin_url"
    t.string   "instagram_url"
    t.string   "snapchat_url"
    t.string   "youtube_url"
    t.string   "angellist_url"
    t.string   "medium_url"
    t.string   "producthunt_url"
    t.string   "reddit_url"
    t.string   "twitch_url"
    t.string   "profile_image_url"
  end

  create_table "person_groups", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_users", force: :cascade do |t|
    t.integer  "person_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_interests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "interest_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.boolean  "admin",                  default: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.integer  "age"
    t.integer  "type"
    t.string   "location_town"
    t.string   "inerest_main"
    t.text     "about"
    t.string   "avatar"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

end
