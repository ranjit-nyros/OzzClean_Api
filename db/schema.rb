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

ActiveRecord::Schema.define(:version => 20140627091415) do

  create_table "activities", :force => true do |t|
    t.date     "date"
    t.text     "info"
    t.integer  "category_id"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.string   "tags"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.string   "attachment"
    t.integer  "attachments_count", :default => 0
    t.string   "priority"
  end

  add_index "activities", ["category_id"], :name => "index_activities_on_category_id"
  add_index "activities", ["date"], :name => "index_activities_on_date"
  add_index "activities", ["organization_id"], :name => "index_activities_on_organization_id"
  add_index "activities", ["priority"], :name => "index_activities_on_priority"
  add_index "activities", ["tags"], :name => "index_activities_on_tags"
  add_index "activities", ["user_id"], :name => "index_activities_on_user_id"

  create_table "api_keys", :force => true do |t|
    t.string   "name"
    t.string   "company"
    t.string   "email"
    t.string   "access_token"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "linkimages", :force => true do |t|
    t.string   "link_image"
    t.integer  "link_id"
    t.string   "content_type"
    t.string   "file_size"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "links", :force => true do |t|
    t.string   "product"
    t.string   "link"
    t.string   "user_name"
    t.string   "pwd_hint"
    t.text     "notes"
    t.integer  "organization_id"
    t.integer  "user_id"
    t.boolean  "sharebox"
    t.string   "share_option"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "list_cleans", :force => true do |t|
    t.date     "date"
    t.string   "source"
    t.string   "upload_by"
    t.text     "file_name"
    t.text     "selection_query"
    t.string   "cleaned_by"
    t.date     "clean_date"
    t.integer  "no_of_records"
    t.integer  "no_of_good"
    t.string   "qa_by"
    t.date     "qa_date"
    t.text     "qa_notes"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.integer  "user_id"
    t.integer  "organization_id"
    t.date     "upload_date"
    t.string   "file"
    t.integer  "phone_num"
    t.string   "company"
    t.string   "contact"
    t.integer  "sic"
    t.integer  "zip"
    t.integer  "area_code"
    t.boolean  "good"
    t.text     "list_notes"
    t.string   "status"
    t.string   "newfile"
  end

  create_table "organizations", :force => true do |t|
    t.string   "name"
    t.integer  "users_count"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "pages", :force => true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.text     "message"
    t.string   "companyname"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "personal_links", :force => true do |t|
    t.string   "url"
    t.string   "name"
    t.string   "message_line"
    t.string   "bgcolor"
    t.integer  "organization_id"
    t.string   "attachment"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "sales_genie_data", :force => true do |t|
    t.string   "good"
    t.date     "upload_date"
    t.string   "file"
    t.string   "phone_num"
    t.string   "company"
    t.string   "contact"
    t.string   "sic"
    t.string   "zip"
    t.string   "area_code"
    t.text     "address"
    t.string   "city"
    t.string   "state"
    t.text     "sic_description"
    t.string   "owner"
    t.string   "cfo"
    t.string   "controller"
    t.string   "ap"
    t.string   "ar"
    t.string   "hr"
    t.string   "cio"
    t.string   "it"
    t.string   "sales_manager"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.integer  "list_clean_id"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.date     "exp_date"
    t.string   "score"
    t.string   "emp_size"
    t.integer  "iusa_num"
    t.integer  "fax_num"
    t.string   "sales_volume"
    t.integer  "count",             :default => 0
    t.date     "up_date"
    t.date     "last_updated_date"
    t.string   "title"
  end

  create_table "test_summaries", :force => true do |t|
    t.date     "test_date"
    t.string   "caller"
    t.text     "script_summary"
    t.integer  "test_size"
    t.integer  "num_of_interested"
    t.integer  "ap_names"
    t.integer  "cfo_names"
    t.integer  "owner_names"
    t.integer  "total_names"
    t.integer  "employe_size"
    t.integer  "dept_size"
    t.integer  "user_id"
    t.integer  "organization_id"
    t.datetime "created_at",                              :null => false
    t.datetime "updated_at",                              :null => false
    t.string   "file"
    t.text     "notes"
    t.text     "test_goal",         :limit => 2147483647
    t.string   "newfile"
    t.string   "status"
  end

  create_table "users", :force => true do |t|
    t.string   "username",                        :null => false
    t.string   "email"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at",                      :null => false
    t.datetime "updated_at",                      :null => false
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.boolean  "admin"
    t.string   "name"
    t.boolean  "active"
    t.integer  "organization_id"
    t.string   "question"
    t.string   "answer"
  end

  add_index "users", ["organization_id"], :name => "index_users_on_organization_id"
  add_index "users", ["remember_me_token"], :name => "index_users_on_remember_me_token"
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token"

end
