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

ActiveRecord::Schema.define(version: 2019_04_12_050955) do

  create_table "inquiries", force: :cascade do |t|
    t.string "name"
    t.text "content"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_application_responses", force: :cascade do |t|
    t.integer "user_id"
    t.integer "post_application_id"
    t.text "participation"
    t.text "reason"
    t.text "caption"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_applications", force: :cascade do |t|
    t.text "title"
    t.integer "user_id"
    t.text "comment"
    t.text "place"
    t.datetime "date"
    t.datetime "deadline"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target_grade"
    t.string "target_home"
    t.string "target_section"
  end

  create_table "post_blogs", force: :cascade do |t|
    t.integer "user_id"
    t.string "image_id"
    t.text "title"
    t.text "content"
    t.text "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_files", force: :cascade do |t|
    t.string "title"
    t.text "caption"
    t.integer "user_id"
    t.string "file_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "target_grade"
    t.string "target_section"
    t.string "target_home"
    t.string "target_authority"
    t.string "file_filename"
  end

  create_table "post_images", force: :cascade do |t|
    t.string "main_image_id"
    t.string "sub_image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_informations", force: :cascade do |t|
    t.text "title"
    t.integer "user_id"
    t.text "comment"
    t.text "place"
    t.datetime "date"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string "firstname"
    t.string "lastname"
    t.string "home"
    t.string "section"
    t.string "address"
    t.string "faculty"
    t.string "grade"
    t.string "authority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.text "comment"
    t.string "position"
    t.string "char_lastname"
    t.string "char_firstname"
    t.string "ruby_lastname"
    t.string "ruby_firstname"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
