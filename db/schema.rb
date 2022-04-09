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

ActiveRecord::Schema[7.0].define(version: 2022_04_09_062017) do
  create_table "url_tags", force: :cascade do |t|
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "url_id", null: false
    t.index ["url_id"], name: "index_url_tags_on_url_id"
  end

  create_table "url_traces", force: :cascade do |t|
    t.float "latitude"
    t.float "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "url_id", null: false
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "state_code"
    t.string "postal_code"
    t.string "country"
    t.string "country_code"
    t.index ["url_id"], name: "index_url_traces_on_url_id"
  end

  create_table "urls", force: :cascade do |t|
    t.string "target_url", null: false
    t.string "short_url", limit: 15, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id", null: false
    t.integer "clicks", default: 0
    t.index ["short_url"], name: "unique_short_url", unique: true
    t.index ["user_id"], name: "index_urls_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name", null: false
    t.string "last_name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "unique_emails", unique: true
  end

  add_foreign_key "url_tags", "urls"
  add_foreign_key "url_traces", "urls"
  add_foreign_key "urls", "users"
end
