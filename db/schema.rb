# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_28_163913) do

  create_table "interests", force: :cascade do |t|
    t.integer "loved_one_id", null: false
    t.string "interest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loved_one_id"], name: "index_interests_on_loved_one_id"
  end

  create_table "loved_ones", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name", null: false
    t.date "birthday", null: false
    t.integer "age"
    t.string "gender"
    t.string "image_url"
    t.string "relationship", null: false
    t.string "mailing_address1"
    t.string "mailing_address2"
    t.string "mailing_city"
    t.string "mailing_state"
    t.string "mailing_zip"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_loved_ones_on_user_id"
  end

  create_table "present_ideas", force: :cascade do |t|
    t.integer "loved_one_id", null: false
    t.string "title", null: false
    t.string "url"
    t.text "description"
    t.string "status", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["loved_one_id"], name: "index_present_ideas_on_loved_one_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "interests", "loved_ones"
  add_foreign_key "loved_ones", "users"
  add_foreign_key "present_ideas", "loved_ones"
end
