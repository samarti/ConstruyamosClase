# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160511024159) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "student_id"
  end

  add_index "courses", ["student_id"], name: "index_courses_on_student_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "url"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "name"
    t.json     "tags"
    t.string   "description"
    t.integer  "teacher_id"
    t.float    "average_rating"
  end

  add_index "documents", ["teacher_id"], name: "index_documents_on_teacher_id", using: :btree

  create_table "documents_levels", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "level_id",    null: false
  end

  create_table "documents_subjects", id: false, force: :cascade do |t|
    t.integer "document_id", null: false
    t.integer "subject_id",  null: false
  end

  create_table "levels", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "grade"
    t.text     "comment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "document_id"
    t.integer  "teacher_id"
  end

  add_index "ratings", ["document_id"], name: "index_ratings_on_document_id", using: :btree
  add_index "ratings", ["teacher_id"], name: "index_ratings_on_teacher_id", using: :btree

  create_table "students", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subjects", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "profile_picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "course_id"
  end

  add_index "teachers", ["course_id"], name: "index_teachers_on_course_id", using: :btree

  add_foreign_key "courses", "students"
  add_foreign_key "documents", "teachers"
  add_foreign_key "ratings", "documents"
  add_foreign_key "ratings", "teachers"
  add_foreign_key "teachers", "courses"
end
