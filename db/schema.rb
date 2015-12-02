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

ActiveRecord::Schema.define(version: 20151030181422) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.text "title"
  end

  create_table "movies", force: :cascade do |t|
    t.string   "title"
    t.text     "overview"
    t.string   "release_date"
    t.string   "poster_url"
    t.text     "tagline"
    t.integer  "runtime"
    t.string   "imdb_id"
    t.integer  "tmd_id"
    t.string   "backdrop_url"
    t.string   "genre"
    t.integer  "genre_id"
    t.boolean  "adult"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.boolean  "used"
  end

  create_table "quotes", force: :cascade do |t|
    t.text     "quote"
    t.string   "audio_path"
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "quotes", ["movie_id"], name: "index_quotes_on_movie_id", using: :btree

  create_table "user_events", force: :cascade do |t|
    t.integer "user_id"
    t.integer "event_id"
    t.text    "liked"
    t.integer "shown_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.text "name"
    t.text "gender"
  end

end
