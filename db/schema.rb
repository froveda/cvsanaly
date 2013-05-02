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

ActiveRecord::Schema.define(:version => 0) do

  create_table "action_files", :id => false, :force => true do |t|
    t.integer "file_id"
    t.integer "action_id",                :default => 0, :null => false
    t.string  "action_type", :limit => 1
    t.integer "commit_id"
  end

  create_table "actions", :force => true do |t|
    t.string  "type",      :limit => 1
    t.integer "file_id"
    t.integer "commit_id"
    t.integer "branch_id"
  end

  add_index "actions", ["branch_id"], :name => "branch_id"
  add_index "actions", ["commit_id"], :name => "commit_id"
  add_index "actions", ["file_id"], :name => "file_id"

  create_table "actions_file_names", :id => false, :force => true do |t|
    t.integer "id",                                :default => 0, :null => false
    t.string  "type",          :limit => 1
    t.integer "file_id"
    t.text    "new_file_name", :limit => 16777215
    t.integer "commit_id"
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

  create_table "file_types", :force => true do |t|
    t.integer "file_id"
    t.text    "type",    :limit => 16777215
  end

  add_index "file_types", ["file_id"], :name => "file_id"

  create_table "files", :force => true do |t|
    t.string  "file_name"
    t.integer "repository_id"
  end

  add_index "files", ["file_name"], :name => "file_name"
  add_index "files", ["repository_id"], :name => "repository_id"

  create_table "metrics", :force => true do |t|
    t.integer "file_id"
    t.integer "commit_id"
    t.text    "lang",            :limit => 255
    t.integer "sloc"
    t.integer "loc"
    t.integer "ncomment"
    t.integer "lcomment"
    t.integer "lblank"
    t.integer "nfunctions"
    t.integer "mccabe_max"
    t.integer "mccabe_min"
    t.integer "mccabe_sum"
    t.integer "mccabe_mean"
    t.integer "mccabe_median"
    t.integer "halstead_length"
    t.integer "halstead_vol"
    t.float   "halstead_level"
    t.integer "halstead_md"
  end

  add_index "metrics", ["commit_id"], :name => "commit_id"
  add_index "metrics", ["file_id"], :name => "file_id"

  create_table "people", :force => true do |t|
    t.string "name"
    t.string "email"
  end

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

end
