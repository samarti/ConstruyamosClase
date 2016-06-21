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

ActiveRecord::Schema.define(version: 20160621224752) do

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

  create_table "levels_teachers", id: false, force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "level_id",   null: false
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
    t.string   "icon"
  end

  create_table "subjects_teachers", id: false, force: :cascade do |t|
    t.integer "teacher_id", null: false
    t.integer "subject_id", null: false
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "taggable_id"
    t.string   "taggable_type"
    t.integer  "tagger_id"
    t.string   "tagger_type"
    t.string   "context",       limit: 128
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree
  add_index "taggings", ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name"
    t.integer "taggings_count", default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

  create_table "teachers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "profile_picture"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "course_id"
    t.string   "password_digest"
  end

  add_index "teachers", ["course_id"], name: "index_teachers_on_course_id", using: :btree
  add_index "teachers", ["email"], name: "index_teachers_on_email", unique: true, using: :btree

  add_foreign_key "courses", "students"
  add_foreign_key "documents", "teachers"
  add_foreign_key "ratings", "documents"
  add_foreign_key "ratings", "teachers"
  add_foreign_key "teachers", "courses"
end
