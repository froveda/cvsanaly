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

ActiveRecord::Schema.define(:version => 20170309220229) do

  create_table "action_files", :force => true do |t|
    t.integer  "file_id"
    t.integer  "action_id"
    t.string   "action_type"
    t.integer  "commit_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "actions", :force => true do |t|
    t.string  "type"
    t.integer "file_id"
    t.integer "commit_id"
    t.integer "branch_id"
  end

  add_index "actions", ["branch_id"], :name => "branch_id"
  add_index "actions", ["commit_id"], :name => "commit_id"
  add_index "actions", ["file_id"], :name => "file_id"

  create_table "actions_file_names", :id => false, :force => true do |t|
    t.integer "id",            :limit => 1, :null => false
    t.integer "type",          :limit => 1, :null => false
    t.integer "file_id",       :limit => 1, :null => false
    t.integer "new_file_name", :limit => 1, :null => false
    t.integer "commit_id",     :limit => 1, :null => false
  end

  create_table "branches", :force => true do |t|
    t.string "name"
  end

  create_table "file_copies", :force => true do |t|
    t.integer "to_id"
    t.integer "from_id"
    t.integer "from_commit_id"
    t.text    "new_file_name",  :limit => 16777215
    t.integer "action_id"
  end

  add_index "file_copies", ["action_id"], :name => "action_id"
  add_index "file_copies", ["from_commit_id"], :name => "from_commit_id"
  add_index "file_copies", ["from_id"], :name => "from_id"
  add_index "file_copies", ["to_id"], :name => "to_id"

  create_table "file_links", :force => true do |t|
    t.integer "parent_id"
    t.integer "file_id"
    t.integer "commit_id"
    t.string  "file_path", :limit => 4096
  end

  add_index "file_links", ["commit_id"], :name => "commit_id"
  add_index "file_links", ["file_id"], :name => "file_id"
  add_index "file_links", ["parent_id"], :name => "parent_id"

  create_table "file_scms", :force => true do |t|
    t.string   "file_name"
    t.integer  "repository_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "file_types", :force => true do |t|
    t.integer  "file_id"
    t.text     "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "files", :force => true do |t|
    t.string  "file_name"
    t.integer "repository_id"
  end

  add_index "files", ["file_name"], :name => "file_name"
  add_index "files", ["repository_id"], :name => "repository_id"

  create_table "metrics", :force => true do |t|
    t.integer  "file_id"
    t.integer  "commit_id"
    t.text     "lang"
    t.integer  "sloc"
    t.integer  "loc"
    t.integer  "ncomment"
    t.integer  "lcomment"
    t.integer  "lblank"
    t.integer  "nfunctions"
    t.integer  "mccabe_max"
    t.integer  "mccabe_min"
    t.integer  "mccabe_sum"
    t.integer  "mccabe_mean"
    t.integer  "mccabe_median"
    t.integer  "halstead_length"
    t.integer  "halstead_vol"
    t.float    "halstead_level"
    t.integer  "halstead_md"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "metrics_evo", :force => true do |t|
    t.integer  "branch_id"
    t.datetime "date"
    t.integer  "loc"
    t.integer  "sloc"
    t.integer  "files"
  end

  create_table "months", :force => true do |t|
    t.datetime "date"
  end

  create_table "people", :force => true do |t|
    t.string "name"
    t.string "email"
  end

  create_table "rails_admin_histories", :force => true do |t|
    t.text     "message"
    t.string   "username"
    t.integer  "item"
    t.string   "table"
    t.integer  "month",      :limit => 2
    t.integer  "year",       :limit => 8
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  add_index "rails_admin_histories", ["item", "table", "month", "year"], :name => "index_rails_admin_histories"

  create_table "repositories", :force => true do |t|
    t.string "uri"
    t.string "name"
    t.string "type", :limit => 30
  end

  create_table "scmlog", :force => true do |t|
    t.text     "rev",           :limit => 16777215
    t.integer  "committer_id"
    t.integer  "author_id"
    t.datetime "date"
    t.text     "message",       :limit => 2147483647
    t.boolean  "composed_rev"
    t.integer  "repository_id"
  end

  add_index "scmlog", ["author_id"], :name => "author_id"
  add_index "scmlog", ["committer_id"], :name => "committer_id"
  add_index "scmlog", ["repository_id"], :name => "repository_id"

  create_table "tag_revisions", :force => true do |t|
    t.integer "tag_id"
    t.integer "commit_id"
  end

  add_index "tag_revisions", ["commit_id"], :name => "commit_id"
  add_index "tag_revisions", ["tag_id"], :name => "tag_id"

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
