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

ActiveRecord::Schema.define(version: 2021_07_11_070936) do

  create_table "actors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actors_series", id: false, force: :cascade do |t|
    t.integer "actor_id", null: false
    t.integer "series_id", null: false
    t.index ["actor_id"], name: "index_actors_series_on_actor_id"
    t.index ["series_id"], name: "index_actors_series_on_series_id"
  end

  create_table "locations", force: :cascade do |t|
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "locations_series", id: false, force: :cascade do |t|
    t.integer "location_id", null: false
    t.integer "series_id", null: false
    t.index ["location_id"], name: "index_locations_series_on_location_id"
    t.index ["series_id"], name: "index_locations_series_on_series_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "user"
    t.integer "stars"
    t.text "review"
    t.integer "series_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["series_id"], name: "index_reviews_on_series_id"
  end

  create_table "series", force: :cascade do |t|
    t.string "name"
    t.string "genre"
    t.integer "no_of_seasons"
    t.date "date_of_first_release"
    t.string "director"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
