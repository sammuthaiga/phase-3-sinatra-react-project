# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2023_03_05_080313) do

  create_table "plumbers", force: :cascade do |t|
    t.string "name"
    t.string "image_url"
    t.string "task"
    t.string "description"
    t.string "phone_number"
    t.string "location"
    t.integer "star_rating"
    t.string "comment"
    t.string "datetime"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "services", force: :cascade do |t|
    t.integer "user_id"
    t.integer "plumber_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "Fullname"
    t.string "image_url"
    t.string "email"
    t.string "phone_number"
    t.string "task"
    t.string "description"
    t.integer "star_rating"
    t.string "comment"
    t.string "feedback"
    t.string "location"
    
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
   
  end

end
