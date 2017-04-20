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

ActiveRecord::Schema.define(version: 20170420194436) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "affiliates", force: :cascade do |t|
    t.string   "name"
    t.string   "affid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "offers", force: :cascade do |t|
    t.string   "title"
    t.string   "link_to_image"
    t.boolean  "is_capped"
    t.decimal  "EPC"
    t.string   "lp_offer_name"
    t.integer  "rank"
    t.string   "zlink"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "tier_affiliates", force: :cascade do |t|
    t.integer  "tier_id"
    t.integer  "affiliate_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["affiliate_id"], name: "index_tier_affiliates_on_affiliate_id", using: :btree
    t.index ["tier_id"], name: "index_tier_affiliates_on_tier_id", using: :btree
  end

  create_table "tier_offers", force: :cascade do |t|
    t.integer  "tier_id"
    t.integer  "offer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["offer_id"], name: "index_tier_offers_on_offer_id", using: :btree
    t.index ["tier_id"], name: "index_tier_offers_on_tier_id", using: :btree
  end

  create_table "tiers", force: :cascade do |t|
    t.string   "title"
    t.string   "vertical_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "name"
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "tier_affiliates", "affiliates"
  add_foreign_key "tier_affiliates", "tiers"
  add_foreign_key "tier_offers", "offers"
  add_foreign_key "tier_offers", "tiers"
end
