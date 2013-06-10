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

ActiveRecord::Schema.define(version: 20130307215115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_genres", force: true do |t|
    t.integer  "artist_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_genres", ["artist_id"], name: "index_artist_genres_on_artist_id", using: :btree
  add_index "artist_genres", ["genre_id"], name: "index_artist_genres_on_genre_id", using: :btree

  create_table "artist_releases", force: true do |t|
    t.integer  "artist_id"
    t.integer  "release_id"
    t.integer  "artistic_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_releases", ["artist_id"], name: "index_artist_releases_on_artist_id", using: :btree
  add_index "artist_releases", ["artistic_role_id"], name: "index_artist_releases_on_artistic_role_id", using: :btree
  add_index "artist_releases", ["release_id"], name: "index_artist_releases_on_release_id", using: :btree

  create_table "artist_tracks", force: true do |t|
    t.integer  "artist_id"
    t.integer  "track_id"
    t.integer  "artistic_role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "artist_tracks", ["artist_id"], name: "index_artist_tracks_on_artist_id", using: :btree
  add_index "artist_tracks", ["artistic_role_id"], name: "index_artist_tracks_on_artistic_role_id", using: :btree
  add_index "artist_tracks", ["track_id"], name: "index_artist_tracks_on_track_id", using: :btree

  create_table "artistic_roles", force: true do |t|
    t.string   "role"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "artists", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "artists", ["name"], name: "index_artists_on_name", unique: true, using: :btree
  add_index "artists", ["user_id"], name: "index_artists_on_user_id", using: :btree

  create_table "definitions", force: true do |t|
    t.text     "text"
    t.integer  "track_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "range_start", null: false
    t.integer  "range_end",   null: false
  end

  add_index "definitions", ["track_id"], name: "index_definitions_on_track_id", using: :btree
  add_index "definitions", ["user_id"], name: "index_definitions_on_user_id", using: :btree

  create_table "genre_releases", force: true do |t|
    t.integer  "release_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genre_releases", ["genre_id"], name: "index_genre_releases_on_genre_id", using: :btree
  add_index "genre_releases", ["release_id"], name: "index_genre_releases_on_release_id", using: :btree

  create_table "genre_tracks", force: true do |t|
    t.integer  "track_id"
    t.integer  "genre_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "genre_tracks", ["genre_id"], name: "index_genre_tracks_on_genre_id", using: :btree
  add_index "genre_tracks", ["track_id"], name: "index_genre_tracks_on_track_id", using: :btree

  create_table "genres", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "labels", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "release_kinds", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "release_tracks", force: true do |t|
    t.integer  "release_id"
    t.integer  "track_id"
    t.integer  "position"
    t.integer  "disc_number"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "release_tracks", ["release_id"], name: "index_release_tracks_on_release_id", using: :btree
  add_index "release_tracks", ["track_id"], name: "index_release_tracks_on_track_id", using: :btree

  create_table "releases", force: true do |t|
    t.string   "name"
    t.integer  "release_kind_id"
    t.integer  "label_id"
    t.string   "release_date"
    t.string   "location"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "releases", ["label_id"], name: "index_releases_on_label_id", using: :btree
  add_index "releases", ["release_kind_id"], name: "index_releases_on_release_kind_id", using: :btree
  add_index "releases", ["user_id"], name: "index_releases_on_user_id", using: :btree

  create_table "tracks", force: true do |t|
    t.string   "name"
    t.string   "duration"
    t.text     "lyrics"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "tracks", ["user_id"], name: "index_tracks_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "youtube_videos", force: true do |t|
    t.text     "embed_html"
    t.integer  "track_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "youtube_videos", ["track_id"], name: "index_youtube_videos_on_track_id", using: :btree

end
