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

ActiveRecord::Schema.define(version: 20160926090007) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_post_tag_details", force: :cascade do |t|
    t.integer  "blog_post_id"
    t.integer  "blog_post_tag_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["blog_post_id"], name: "index_blog_post_tag_details_on_blog_post_id", using: :btree
    t.index ["blog_post_tag_id"], name: "index_blog_post_tag_details_on_blog_post_tag_id", using: :btree
  end

  create_table "blog_post_tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blog_posts", force: :cascade do |t|
    t.string   "title",           limit: 45
    t.string   "summary",         limit: 150
    t.text     "content"
    t.string   "title_image_url", limit: 150
    t.integer  "user_id"
    t.integer  "view_count"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["user_id"], name: "index_blog_posts_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",           limit: 45
    t.string   "email",          limit: 45
    t.string   "password"
    t.boolean  "is_admin"
    t.integer  "activity_count"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_foreign_key "blog_post_tag_details", "blog_post_tags"
  add_foreign_key "blog_post_tag_details", "blog_posts"
  add_foreign_key "blog_posts", "users"
end
