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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_185538) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "discounts", force: :cascade do |t|
    t.string "name", null: false
    t.float "deduction_in_percent", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_discounts_on_name", unique: true
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_ingredients_on_name", unique: true
  end

  create_table "pizzas", force: :cascade do |t|
    t.string "name", null: false
    t.float "price", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_pizzas_on_name", unique: true
  end

  create_table "promotions", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "target_pizza_id"
    t.integer "target_size", null: false
    t.integer "from", null: false
    t.integer "to", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_promotions_on_name", unique: true
    t.index ["target_pizza_id"], name: "index_promotions_on_target_pizza_id"
  end

  add_foreign_key "promotions", "pizzas", column: "target_pizza_id"
end
