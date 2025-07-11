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

ActiveRecord::Schema[8.0].define(version: 2025_07_11_075410) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "budget_categories", force: :cascade do |t|
    t.string "name"
    t.integer "spending_limit_percentage"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "budget_projects", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.decimal "amount"
    t.bigint "budget_category_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "phase_id", null: false
    t.index ["budget_category_id"], name: "index_budget_projects_on_budget_category_id"
    t.index ["phase_id"], name: "index_budget_projects_on_phase_id"
  end

  create_table "impact_metrics", force: :cascade do |t|
    t.bigint "budget_project_id", null: false
    t.integer "estimated_beneficiaries"
    t.string "timeline"
    t.integer "sustainability_score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_project_id"], name: "index_impact_metrics_on_budget_project_id"
  end

  create_table "phases", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id"
    t.bigint "budget_project_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_project_id"], name: "index_votes_on_budget_project_id"
  end

  add_foreign_key "budget_projects", "budget_categories"
  add_foreign_key "budget_projects", "phases"
  add_foreign_key "impact_metrics", "budget_projects"
  add_foreign_key "votes", "budget_projects"
end
