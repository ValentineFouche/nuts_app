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

ActiveRecord::Schema.define(version: 2022_04_07_205700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookrecoms", force: :cascade do |t|
    t.string "friend"
    t.text "comment"
    t.boolean "searched"
    t.boolean "viewed"
    t.text "feedback_content"
    t.integer "feedback_rating"
    t.bigint "user_id", null: false
    t.bigint "book_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["book_id"], name: "index_bookrecoms_on_book_id"
    t.index ["user_id"], name: "index_bookrecoms_on_user_id"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "movies", force: :cascade do |t|
    t.string "title"
    t.string "director"
    t.string "image_url"
    t.string "stream_options"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "podcastrecoms", force: :cascade do |t|
    t.string "friend"
    t.text "comment"
    t.boolean "searched"
    t.boolean "viewed"
    t.text "feedback_content"
    t.integer "feedback_rating"
    t.bigint "podcast_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "podcast"
    t.index ["podcast_id"], name: "index_podcastrecoms_on_podcast_id"
    t.index ["user_id"], name: "index_podcastrecoms_on_user_id"
  end

  create_table "podcasts", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "recommendations", force: :cascade do |t|
    t.string "friend"
    t.time "added_on"
    t.text "comment"
    t.boolean "searched", default: false
    t.boolean "viewed", default: false
    t.text "feedback_content"
    t.integer "feedback_rating"
    t.bigint "user_id", null: false
    t.bigint "movie_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["movie_id"], name: "index_recommendations_on_movie_id"
    t.index ["user_id"], name: "index_recommendations_on_user_id"
  end

  create_table "restaurantrecoms", force: :cascade do |t|
    t.string "friend"
    t.text "comment"
    t.boolean "searched"
    t.boolean "viewed"
    t.text "feedback_content"
    t.integer "feedback_rating"
    t.bigint "restaurant_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["restaurant_id"], name: "index_restaurantrecoms_on_restaurant_id"
    t.index ["user_id"], name: "index_restaurantrecoms_on_user_id"
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "nickname"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookrecoms", "books"
  add_foreign_key "bookrecoms", "users"
  add_foreign_key "podcastrecoms", "podcasts"
  add_foreign_key "podcastrecoms", "users"
  add_foreign_key "recommendations", "movies"
  add_foreign_key "recommendations", "users"
  add_foreign_key "restaurantrecoms", "restaurants"
  add_foreign_key "restaurantrecoms", "users"
end
