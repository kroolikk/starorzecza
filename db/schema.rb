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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121002175628) do

  create_table "events", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.datetime "event_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "events", ["slug"], :name => "index_events_on_slug"

  create_table "galleries", :force => true do |t|
    t.string   "name"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "label"
    t.string   "slug"
    t.boolean  "hidden",     :default => false
  end

  add_index "galleries", ["slug"], :name => "index_galleries_on_slug"

  create_table "infos", :force => true do |t|
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.integer  "priority"
    t.boolean  "featured"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "slug"
  end

  add_index "infos", ["slug"], :name => "index_infos_on_slug"

  create_table "newsletter_users", :force => true do |t|
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "label"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "title"
    t.string   "slug"
  end

  add_index "pages", ["slug"], :name => "index_pages_on_slug"

  create_table "photos", :force => true do |t|
    t.integer  "gallery_id"
    t.string   "photo"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
    t.string   "title"
    t.text     "description"
    t.boolean  "sg",          :default => false
  end

  create_table "vids", :force => true do |t|
    t.string   "title"
    t.text     "fileurl"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.string   "slug"
  end

  add_index "vids", ["slug"], :name => "index_vids_on_slug"

end
