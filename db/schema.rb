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

ActiveRecord::Schema.define(:version => 20130502094353) do

  create_table "comments", :force => true do |t|
    t.string   "subject"
    t.string   "message"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["job_id"], :name => "index_comments_on_job_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "images", :force => true do |t|
    t.string   "caption"
    t.string   "file"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.integer  "file_file_size"
    t.datetime "file_updated_at"
  end

  add_index "images", ["job_id"], :name => "index_images_on_job_id"
  add_index "images", ["user_id"], :name => "index_images_on_user_id"

  create_table "jobs", :force => true do |t|
    t.string   "title"
    t.string   "cad_file"
    t.string   "material"
    t.boolean  "is_private"
    t.string   "order_status"
    t.integer  "service_id"
    t.integer  "user_id"
    t.integer  "sketchfab_id"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "cad_file_file_name"
    t.string   "cad_file_content_type"
    t.integer  "cad_file_file_size"
    t.datetime "cad_file_updated_at"
  end

  add_index "jobs", ["service_id"], :name => "index_jobs_on_service_id"
  add_index "jobs", ["user_id"], :name => "index_jobs_on_user_id"

  create_table "services", :force => true do |t|
    t.string   "title"
    t.string   "type_of_service"
    t.string   "printer_model"
    t.string   "website"
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "services", ["address"], :name => "index_services_on_address"
  add_index "services", ["printer_model"], :name => "index_services_on_printer_model"
  add_index "services", ["type_of_service"], :name => "index_services_on_type_of_service"
  add_index "services", ["user_id"], :name => "index_services_on_user_id"

  create_table "sketchfabs", :force => true do |t|
    t.string   "provider_url"
    t.string   "provider_name"
    t.string   "thumbnail_url"
    t.string   "thumbnail_width"
    t.string   "thumbnail_height"
    t.string   "author_name"
    t.string   "author_url"
    t.string   "title"
    t.text     "html"
    t.integer  "width"
    t.integer  "height"
    t.string   "version"
    t.string   "sketchfab_type"
    t.integer  "job_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "address"
    t.string   "phone"
    t.string   "website"
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "is_designer"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["is_designer"], :name => "index_users_on_is_designer"
  add_index "users", ["name"], :name => "index_users_on_name"

end
