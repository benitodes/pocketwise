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

ActiveRecord::Schema.define(version: 2019_08_13_131159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.text "answer_content"
    t.boolean "correct"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.boolean "complete"
    t.string "picture"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_courses_on_category_id"
  end

  create_table "goals", force: :cascade do |t|
    t.integer "goal_allowance"
    t.integer "goal_price"
    t.integer "goal_current_saving"
    t.boolean "complete"
    t.bigint "wallet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "picture"
    t.index ["wallet_id"], name: "index_goals_on_wallet_id"
  end

  create_table "lectures", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "picture"
    t.boolean "complete"
    t.bigint "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["level_id"], name: "index_lectures_on_level_id"
  end

  create_table "levels", force: :cascade do |t|
    t.string "name"
    t.integer "number"
    t.boolean "complete"
    t.string "picture"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_levels_on_course_id"
  end

  create_table "questions", force: :cascade do |t|
    t.text "question_content"
    t.boolean "complete"
    t.text "hint"
    t.string "picture"
    t.bigint "level_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "number"
    t.index ["level_id"], name: "index_questions_on_level_id"
  end

  create_table "user_courses", force: :cascade do |t|
    t.bigint "course_id"
    t.bigint "kid_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_user_courses_on_course_id"
    t.index ["kid_id"], name: "index_user_courses_on_kid_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.string "avatar"
    t.string "gender"
    t.integer "age"
    t.boolean "parent", default: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wallets", force: :cascade do |t|
    t.integer "payout_amount"
    t.string "payout_frequency"
    t.bigint "kid_id"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_allowance"
    t.string "payout_day"
    t.index ["kid_id"], name: "index_wallets_on_kid_id"
    t.index ["parent_id"], name: "index_wallets_on_parent_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "courses", "categories"
  add_foreign_key "goals", "wallets"
  add_foreign_key "lectures", "levels"
  add_foreign_key "levels", "courses"
  add_foreign_key "questions", "levels"
  add_foreign_key "user_courses", "courses"
  add_foreign_key "user_courses", "users", column: "kid_id"
  add_foreign_key "wallets", "users", column: "kid_id"
  add_foreign_key "wallets", "users", column: "parent_id"
end
