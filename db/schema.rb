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

ActiveRecord::Schema.define(version: 20140318143509) do

  create_table "admins", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admins", ["email"], name: "index_admins_on_email", unique: true, using: :btree
  add_index "admins", ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true, using: :btree

  create_table "categories", force: true do |t|
    t.string   "name"
    t.integer  "parent_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic"
    t.text     "description"
  end

  create_table "products", force: true do |t|
    t.string   "name"
    t.string   "pic"
    t.integer  "category_id"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "brank"
    t.string   "zhou_num"
    t.string   "arch"
    t.string   "cnc"
    t.string   "longmen"
    t.string   "galvo"
    t.string   "plc"
    t.string   "fieldbus"
    t.string   "control"
    t.string   "output_instr"
    t.string   "electricity"
    t.string   "voltage"
    t.string   "driver_fieldbus"
    t.string   "motor"
    t.string   "linear_motor_range"
    t.string   "rotary_motor"
    t.string   "rotary_motor_range"
    t.string   "special_ap"
    t.string   "thrust_range"
    t.string   "driver"
    t.string   "oriented_form"
    t.string   "slip_special_ap"
    t.string   "sports"
    t.string   "driver_type"
    t.string   "bearing"
    t.string   "max_load"
    t.string   "nano_recommend"
    t.string   "precision"
    t.string   "reduction_ratio"
    t.string   "sports_type"
  end

end
