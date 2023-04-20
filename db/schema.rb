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

ActiveRecord::Schema.define(version: 2023_04_17_054127) do

  create_table "event_members", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "student_name"
    t.string "student_email"
    t.integer "event_id"
    t.integer "photographer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.date "event_date"
    t.string "event_name"
    t.string "event_location"
  end

  create_table "events", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "event_name"
    t.string "event_location"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "school_name"
    t.string "season_name"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "senior_schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "school_name"
    t.string "season_name"
    t.string "session_name"
    t.integer "photographer_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "senior_student_checks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "school_id"
    t.integer "photographer_user_id"
    t.integer "senior_student_id"
    t.integer "internal_student_id"
    t.string "first_name"
    t.string "last_name"
    t.string "subject_id"
    t.string "phone_number"
    t.string "email"
    t.string "check_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "full_name"
    t.string "session_type"
    t.string "student_online_id"
  end

  create_table "senior_students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.integer "school_id"
    t.integer "photographer_user_id"
    t.integer "internal_student_id"
    t.string "first_name"
    t.string "last_name"
    t.integer "online_code"
    t.string "subject_id"
    t.string "phone_number"
    t.string "email"
    t.text "notes"
    t.string "content_type"
    t.string "organiztion"
    t.integer "reference_number"
    t.string "year"
    t.string "grade"
    t.string "group"
    t.text "image_name"
    t.string "yearbook_selection"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "student_name"
    t.string "student_email"
    t.string "parent_email"
    t.string "type_of_sport"
    t.string "team_type"
    t.string "school_name"
    t.string "season_type"
    t.integer "photographer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "season_id"
    t.integer "school_id"
    t.date "event_date"
    t.string "gender"
    t.string "stu_gender"
    t.string "position"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb3", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
