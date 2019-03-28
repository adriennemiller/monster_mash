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

ActiveRecord::Schema.define(version: 2019_03_28_001343) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "body_parts", force: :cascade do |t|
    t.string "section"
    t.string "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "filename"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "head_id"
    t.integer "torso_id"
    t.integer "leg_id"
    t.datetime "time_last_fed"
    t.integer "happiness"
    t.integer "head_x"
    t.integer "head_y"
    t.integer "torso_x"
    t.integer "torso_y"
    t.integer "leg_x"
    t.integer "leg_y"
    t.integer "face_id"
    t.integer "face_x"
    t.integer "face_y"
    t.float "face_scale_x"
    t.float "face_scale_y"
    t.float "head_scale_x"
    t.float "head_scale_y"
    t.float "torso_scale_x"
    t.float "torso_scale_y"
    t.float "leg_scale_x"
    t.float "leg_scale_y"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

end
