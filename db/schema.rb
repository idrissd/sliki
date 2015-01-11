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

ActiveRecord::Schema.define(version: 20150110194643) do

  create_table "abstract_pages", force: true do |t|
    t.integer  "author_id"
    t.integer  "parent_control_id"
    t.string   "type"
    t.string   "name"
    t.string   "state",             default: "new"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.integer  "topic_id"
    t.string   "color",             default: "#CCC"
    t.integer  "position",          default: 0
    t.integer  "x",                 default: 0
    t.integer  "y",                 default: 0
    t.integer  "thing_id"
    t.text     "values"
  end

  add_index "abstract_pages", ["author_id"], name: "index_abstract_pages_on_author_id"
  add_index "abstract_pages", ["parent_control_id"], name: "index_abstract_pages_on_parent_control_id"
  add_index "abstract_pages", ["slug"], name: "index_abstract_pages_on_slug"

  create_table "access_controls", force: true do |t|
    t.integer  "accessible_id"
    t.string   "accessible_type"
    t.string   "control",         default: "deny"
    t.integer  "position",        default: 0
    t.integer  "group_id"
    t.boolean  "create_access",   default: false
    t.boolean  "read_access",     default: false
    t.boolean  "update_access",   default: false
    t.boolean  "destroy_access",  default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "access_controls", ["accessible_id", "accessible_type"], name: "index_access_controls_on_accessible_id_and_accessible_type"
  add_index "access_controls", ["group_id"], name: "index_access_controls_on_group_id"

  create_table "friendly_id_slugs", force: true do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id"
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type"

  create_table "memberships", force: true do |t|
    t.integer  "group_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id"
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id"

  create_table "properties", force: true do |t|
    t.integer  "thing_id"
    t.integer  "parent_control_id"
    t.string   "name"
    t.string   "type",              default: "StringProperty"
    t.integer  "position",          default: 0
    t.boolean  "many",              default: false
    t.boolean  "required",          default: false
    t.string   "matches"
    t.string   "restricted"
    t.decimal  "minimum"
    t.decimal  "maximum"
    t.text     "view"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "properties", ["parent_control_id"], name: "index_properties_on_parent_control_id"
  add_index "properties", ["slug"], name: "index_properties_on_slug"
  add_index "properties", ["thing_id"], name: "index_properties_on_thing_id"

  create_table "subscriptions", force: true do |t|
    t.integer  "topic_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["topic_id", "user_id"], name: "index_subscriptions_on_topic_id_and_user_id"

  create_table "summaries", force: true do |t|
    t.integer  "thing_id"
    t.integer  "parent_control_id"
    t.string   "name"
    t.string   "type",              default: "DataTableSummary"
    t.integer  "position",          default: 0
    t.text     "view"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "summaries", ["parent_control_id"], name: "index_summaries_on_parent_control_id"
  add_index "summaries", ["slug"], name: "index_summaries_on_slug"
  add_index "summaries", ["thing_id"], name: "index_summaries_on_thing_id"

  create_table "transitions", force: true do |t|
    t.integer  "thing_id"
    t.string   "from_state"
    t.string   "to_state"
    t.string   "on_event"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "transitions", ["thing_id"], name: "index_transitions_on_thing_id"

  create_table "users", force: true do |t|
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
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "role"
    t.string   "slug"
    t.string   "authentication_token"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["slug"], name: "index_users_on_slug", unique: true

  create_table "versions", force: true do |t|
    t.string   "item_type",  null: false
    t.integer  "item_id",    null: false
    t.string   "event",      null: false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], name: "index_versions_on_item_type_and_item_id"

end
