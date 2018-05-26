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

ActiveRecord::Schema.define(version: 20170917110953) do

  create_table "genres", force: :cascade do |t|
    t.text "genrename"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "options", force: :cascade do |t|
    t.text "optiontext"
    t.integer "Question_id"
    t.boolean "correct"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Question_id"], name: "index_options_on_Question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "questiontext"
    t.integer "Genre_id"
    t.integer "Subgenre_id"
    t.integer "qtype"
    t.text "image_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Genre_id"], name: "index_questions_on_Genre_id"
    t.index ["Subgenre_id"], name: "index_questions_on_Subgenre_id"
  end

  create_table "questionsets", force: :cascade do |t|
    t.integer "number_correct"
    t.integer "User_id"
    t.integer "Genre_id"
    t.integer "Subgenre_id"
    t.integer "fiftyfifty"
    t.integer "doubledip"
    t.integer "completed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Genre_id"], name: "index_questionsets_on_Genre_id"
    t.index ["Subgenre_id"], name: "index_questionsets_on_Subgenre_id"
    t.index ["User_id"], name: "index_questionsets_on_User_id"
  end

  create_table "subgenres", force: :cascade do |t|
    t.text "subgenrename"
    t.integer "Genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["Genre_id"], name: "index_subgenres_on_Genre_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
