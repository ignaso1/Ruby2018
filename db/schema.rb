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

ActiveRecord::Schema.define(version: 2018_12_08_124913) do

  create_table "admins", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ceos", force: :cascade do |t|
    t.integer "company_id"
    t.float "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["company_id"], name: "index_ceos_on_company_id"
  end

  create_table "comments", force: :cascade do |t|
    t.string "commentable_type"
    t.integer "commentable_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["commentable_type", "commentable_id"], name: "index_comments_on_commentable_type_and_commentable_id"
  end

  create_table "companies", force: :cascade do |t|
    t.integer "admin_id"
    t.float "debt"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["admin_id"], name: "index_companies_on_admin_id"
  end

  create_table "human_resource_managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "leave_notices", force: :cascade do |t|
    t.integer "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["resource_id"], name: "index_leave_notices_on_resource_id"
  end

  create_table "potential_resources", force: :cascade do |t|
    t.integer "human_resource_manager_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["human_resource_manager_id"], name: "index_potential_resources_on_human_resource_manager_id"
  end

  create_table "project_managers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.integer "project_manager_id"
    t.string "name"
    t.integer "resource_reqs"
    t.datetime "start"
    t.datetime "finish"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_manager_id"], name: "index_projects_on_project_manager_id"
  end

  create_table "resources", force: :cascade do |t|
    t.string "manageable_type"
    t.integer "manageable_id"
    t.string "email"
    t.string "name"
    t.string "last_name"
    t.string "position"
    t.float "salary"
    t.date "birthday"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["manageable_type", "manageable_id"], name: "index_resources_on_manageable_type_and_manageable_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "role"
    t.string "name"
    t.string "last_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
