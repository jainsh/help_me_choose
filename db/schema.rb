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

ActiveRecord::Schema.define(version: 20140517220333) do

  create_table "plan_benefits", force: true do |t|
    t.boolean  "coinsurance",     default: false
    t.integer  "copay",           default: 0
    t.integer  "plan_id"
    t.integer  "service_cost_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "plan_benefits", ["plan_id"], name: "index_plan_benefits_on_plan_id", using: :btree
  add_index "plan_benefits", ["service_cost_id"], name: "index_plan_benefits_on_service_cost_id", using: :btree

  create_table "plans", force: true do |t|
    t.string   "name",              limit: 150
    t.integer  "monthly_premium"
    t.integer  "annual_deductible"
    t.integer  "max_oop"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "coinsurance"
    t.string   "code"
  end

  create_table "service_costs", force: true do |t|
    t.string   "name",       limit: 100
    t.integer  "cost"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",                  default: 0
  end

  add_index "service_costs", ["name"], name: "index_service_costs_on_name", using: :btree

  create_table "service_usages", force: true do |t|
    t.integer  "usage_count",      default: 1
    t.integer  "service_cost_id"
    t.integer  "usage_profile_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "service_usages", ["service_cost_id"], name: "index_service_usages_on_service_cost_id", using: :btree
  add_index "service_usages", ["usage_profile_id"], name: "index_service_usages_on_usage_profile_id", using: :btree

  create_table "usage_profiles", force: true do |t|
    t.string   "zipcode",       limit: 10
    t.integer  "gender"
    t.date     "date_of_birth"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "usage_profiles", ["user_id"], name: "index_usage_profiles_on_user_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "first",      limit: 100
    t.string   "last",       limit: 100
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
