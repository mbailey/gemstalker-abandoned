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

ActiveRecord::Schema.define(:version => 20110714035359) do

  create_table "alerts", :force => true do |t|
    t.integer  "user_id"
    t.integer  "release_id"
    t.datetime "user_notified"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "rubygem_id"
    t.boolean  "disabled"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "releases", :force => true do |t|
    t.string   "rubygem_name"
    t.string   "version"
    t.datetime "release_date"
    t.boolean  "pre"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url"
    t.integer  "rubygem_id"
  end

  create_table "rubygems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end

end
