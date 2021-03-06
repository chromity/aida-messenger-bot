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

ActiveRecord::Schema.define(version: 20171202220139) do

  create_table "insurances", force: :cascade do |t|
    t.integer  "user_id"
    t.decimal  "sickness"
    t.decimal  "disability"
    t.decimal  "maternity"
    t.decimal  "retirement"
    t.decimal  "funeral"
    t.decimal  "death"
    t.decimal  "education"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.decimal  "housing"
    t.index ["user_id"], name: "index_insurances_on_user_id"
  end

  create_table "investments", force: :cascade do |t|
    t.string   "type"
    t.boolean  "housing"
    t.boolean  "sickness"
    t.boolean  "disability"
    t.boolean  "maternity"
    t.boolean  "retirement"
    t.boolean  "funeral"
    t.boolean  "death"
    t.boolean  "education"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_investments_on_user_id"
  end

  create_table "trades", force: :cascade do |t|
    t.string   "type"
    t.decimal  "high"
    t.decimal  "low"
    t.decimal  "close"
    t.decimal  "value"
    t.string   "symbol"
    t.string   "name"
    t.string   "volume"
    t.datetime "last_updated"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "messenger_id"
    t.integer  "educational_attachment"
    t.integer  "health_condition"
    t.integer  "income"
    t.integer  "expense"
    t.integer  "goal"
    t.boolean  "monthly"
    t.boolean  "yearly"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name"
  end

end
