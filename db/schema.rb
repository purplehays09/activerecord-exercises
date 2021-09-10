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

ActiveRecord::Schema.define(version: 2021_09_10_160217) do

  create_table "answers", force: :cascade do |t|
    t.string "label"
    t.integer "question_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friendships", force: :cascade do |t|
    t.integer "source_id", null: false
    t.integer "desitination_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["desitination_id"], name: "index_friendships_on_desitination_id"
    t.index ["source_id"], name: "index_friendships_on_source_id"
  end

  create_table "pages", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "parts", force: :cascade do |t|
    t.string "title"
    t.integer "page_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "content"
    t.index ["page_id"], name: "index_parts_on_page_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "category_id"
    t.index ["category_id"], name: "index_posts_on_category_id"
  end

  create_table "questionnaires", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "title"
    t.integer "questionnaire_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["questionnaire_id"], name: "index_questions_on_questionnaire_id"
  end

  create_table "responses", force: :cascade do |t|
    t.integer "answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_responses_on_answer_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "friendships", "people", column: "desitination_id"
  add_foreign_key "friendships", "people", column: "source_id"
  add_foreign_key "parts", "pages"
  add_foreign_key "posts", "categories"
  add_foreign_key "questions", "questionnaires"
  add_foreign_key "responses", "answers"
end
