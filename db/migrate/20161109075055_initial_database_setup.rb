class InitialDatabaseSetup < ActiveRecord::Migration
  def change

  create_table "account_role_rights", force: true do |t|
    t.integer "account_role_id"
    t.integer "right_id"
  end


  add_index "account_role_rights", ["account_role_id"], name: "index_account_role_rights_on_account_role_id", using: :btree


  create_table "account_roles", force: true do |t|
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
  end


  add_index "account_roles", ["id", "account_id"], name: "index_account_roles_on_id_and_account_id", using: :btree


  create_table "categories", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
  end


  create_table "rights", force: true do |t|
    t.string "key"
    t.string "name"
    t.string "category"
    t.string "actions",    limit: 10240
  end


  add_index "rights", ["key"], name: "index_rights_on_key", using: :btree


  create_table "user_roles", force: true do |t|
    t.integer  "user_id"
    t.integer  "account_id"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
  end


  create_table "users", force: true do |t|
    t.string   "email"
    t.string   "password_digest"
    t.string   "username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.text     "about_me"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "phone"
    t.integer  "sign_in_count",        default: 0
    t.datetime "last_sign_in_at"
    t.string   "reset_password_token"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "country",              default: "US"
    t.boolean  "admin",                default: false
    t.string   "encrypted_ssn"
    t.string   "encrypted_dob"
    t.string   "encrypted_ssn_salt"
    t.string   "encrypted_ssn_iv"
    t.string   "encrypted_dob_salt"
    t.string   "encrypted_dob_iv"
    t.string   "vesting"
    t.string   "screen_name"
    t.string   "occupation"
    t.string   "url"
    t.string   "last_sign_in_from_ip"
  end


  add_index "users", ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree


  end
end
