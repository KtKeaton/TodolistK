ActiveRecord::Schema.define(version: 2022_03_27_090911) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "tag"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "category_tasks", force: :cascade do |t|
    t.bigint "task_id", null: false
    t.bigint "category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_category_tasks_on_category_id"
    t.index ["task_id"], name: "index_category_tasks_on_task_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "note"
    t.datetime "due_date", precision: 6
    t.integer "priority"
    t.integer "status", default: 0
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_tasks_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.integer "role"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "category_tasks", "categories"
  add_foreign_key "category_tasks", "tasks"
  add_foreign_key "tasks", "users"

end