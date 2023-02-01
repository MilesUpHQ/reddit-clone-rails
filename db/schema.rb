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

ActiveRecord::Schema.define(version: 2023_02_01_101850) do

  create_table "accounts", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "username"
    t.text "bio"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_accounts_on_email", unique: true
    t.index ["reset_password_token"], name: "index_accounts_on_reset_password_token", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "message"
    t.integer "parent_id"
    t.integer "account_id"
    t.integer "post_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "community_id"
    t.index ["account_id"], name: "index_comments_on_account_id"
    t.index ["post_id"], name: "index_comments_on_post_id"
  end

  create_table "communities", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "name"
    t.string "url"
    t.string "rules"
    t.integer "total_members"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_communities_on_account_id"
  end

  create_table "posts", force: :cascade do |t|
    t.integer "account_id", null: false
    t.integer "community_id", null: false
    t.string "title"
    t.text "body"
    t.integer "upvotes", default: 0
    t.integer "downvotes", default: 0
    t.integer "total_comments", default: 0
    t.boolean "isclosed", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "is_drafted", default: false
    t.index ["account_id"], name: "index_posts_on_account_id"
    t.index ["community_id"], name: "index_posts_on_community_id"
  end

  create_table "report_categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "report_reasons", force: :cascade do |t|
    t.string "reason"
    t.integer "report_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["report_category_id"], name: "index_report_reasons_on_report_category_id"
  end

  create_table "reports", force: :cascade do |t|
    t.integer "post_id", null: false
    t.integer "report_reason_id", null: false
    t.integer "account_id", null: false
    t.integer "report_category_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_reports_on_account_id"
    t.index ["post_id"], name: "index_reports_on_post_id"
    t.index ["report_category_id"], name: "index_reports_on_report_category_id"
    t.index ["report_reason_id"], name: "index_reports_on_report_reason_id"
  end

  create_table "subscriptions", force: :cascade do |t|
    t.integer "account_id"
    t.integer "community_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["account_id"], name: "index_subscriptions_on_account_id"
    t.index ["community_id"], name: "index_subscriptions_on_community_id"
  end

  add_foreign_key "communities", "accounts"
  add_foreign_key "posts", "accounts"
  add_foreign_key "posts", "communities"
  add_foreign_key "report_reasons", "report_categories"
  add_foreign_key "reports", "accounts"
  add_foreign_key "reports", "posts"
  add_foreign_key "reports", "report_categories"
  add_foreign_key "reports", "report_reasons"
end
