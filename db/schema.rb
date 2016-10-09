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

ActiveRecord::Schema.define(version: 20161009173240) do

  create_table "auditoria", force: :cascade do |t|
    t.text     "name"
    t.integer  "capacity"
    t.integer  "theater_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "auditoria", ["theater_id"], name: "index_auditoria_on_theater_id"

  create_table "auditoriums_in_theater", id: false, force: :cascade do |t|
    t.integer "theater_id"
    t.integer "auditorium_id"
  end

  create_table "creditcards", force: :cascade do |t|
    t.string   "number"
    t.datetime "expiration_date"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "creditcards", ["user_id"], name: "index_creditcards_on_user_id"

  create_table "movies", force: :cascade do |t|
    t.string   "movie_name"
    t.integer  "length"
    t.integer  "auditorium_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.datetime "showtime"
  end

  add_index "movies", ["auditorium_id"], name: "index_movies_on_auditorium_id"

  create_table "theaters", force: :cascade do |t|
    t.text     "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer  "movie_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
  end

  add_index "tickets", ["movie_id"], name: "index_tickets_on_movie_id"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
