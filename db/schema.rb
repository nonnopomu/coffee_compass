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

ActiveRecord::Schema[7.2].define(version: 2026_01_08_074036) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "branches", force: :cascade do |t|
    t.integer "answer", null: false
    t.bigint "question_id", null: false
    t.bigint "next_question_id"
    t.bigint "result_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["next_question_id"], name: "index_branches_on_next_question_id"
    t.index ["question_id"], name: "index_branches_on_question_id"
    t.index ["result_id"], name: "index_branches_on_result_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string "text", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "results", force: :cascade do |t|
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "branches", "questions"
  add_foreign_key "branches", "questions", column: "next_question_id"
  add_foreign_key "branches", "results"
end
