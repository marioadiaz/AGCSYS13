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

ActiveRecord::Schema[8.0].define(version: 2025_10_15_162716) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "orden_trabajos", force: :cascade do |t|
    t.integer "trnum"
    t.integer "trcan"
    t.date "trcar"
    t.string "clinom"
    t.string "papel"
    t.integer "gramaje"
    t.string "colores"
    t.integer "pliego"
    t.string "nomprod"
    t.date "fecentr"
    t.string "cam10"
    t.string "cam12"
    t.string "cam24"
    t.string "procesos"
    t.string "observaciones"
    t.string "estado_actual"
    t.boolean "estado"
    t.date "deadline"
    t.string "priority"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
