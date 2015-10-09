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

ActiveRecord::Schema.define(version: 20151009175507) do

  create_table "credit_cards", force: :cascade do |t|
    t.integer  "number"
    t.integer  "exp_month"
    t.integer  "exp_year"
    t.string   "cardholder_name"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "customer_id"
  end

  add_index "credit_cards", ["customer_id"], name: "index_credit_cards_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "email"
    t.string   "phone"
    t.string   "fax"
    t.string   "website"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.boolean  "braintree_sync"
  end

end
