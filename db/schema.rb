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

ActiveRecord::Schema.define(:version => 20120324182229) do

  create_table "assignments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "assignments", ["role_id"], :name => "index_assignments_on_role_id"
  add_index "assignments", ["user_id"], :name => "index_assignments_on_user_id"

  create_table "cities", :force => true do |t|
    t.integer  "state_id"
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "cities", ["state_id"], :name => "index_cities_on_state_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.integer  "work_id"
    t.text     "description"
    t.boolean  "document"
    t.string   "patent_content_type"
    t.datetime "patent_updated_at"
    t.string   "patent_file_name"
    t.integer  "patent_file_size"
    t.string   "enrollment_content_type"
    t.datetime "enrollment_updated_at"
    t.string   "enrollment_file_name"
    t.integer  "enrollment_file_size"
    t.string   "cei_content_type"
    t.datetime "cei_updated_at"
    t.string   "cei_file_name"
    t.integer  "cei_file_size"
    t.string   "gifp_content_type"
    t.datetime "gifp_updated_at"
    t.string   "gifp_file_name"
    t.integer  "gifp_file_size"
    t.string   "invoice_content_type"
    t.datetime "invoice_updated_at"
    t.string   "invoice_file_name"
    t.integer  "invoice_file_size"
    t.string   "inss_content_type"
    t.datetime "inss_updated_at"
    t.string   "inss_file_name"
    t.integer  "inss_file_size"
    t.string   "cnd_content_type"
    t.datetime "cnd_updated_at"
    t.string   "cnd_file_name"
    t.integer  "cnd_file_size"
    t.string   "dwell_content_type"
    t.datetime "dwell_updated_at"
    t.string   "dwell_file_name"
    t.integer  "dwell_file_size"
    t.string   "social_contract_content_type"
    t.datetime "social_contract_updated_at"
    t.string   "social_contract_file_name"
    t.integer  "social_contract_file_size"
    t.string   "avcb_content_type"
    t.datetime "avcb_updated_at"
    t.string   "avcb_file_name"
    t.integer  "avcb_file_size"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"
  add_index "comments", ["work_id"], :name => "index_comments_on_work_id"

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "address"
    t.string   "cnpj"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "states", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "user_sessions", :force => true do |t|
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "crypted_password"
    t.string   "password_salt"
    t.string   "persistence_token"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "work_documents", :force => true do |t|
    t.integer  "work_id"
    t.string   "patent_content_type"
    t.datetime "patent_updated_at"
    t.string   "patent_file_name"
    t.integer  "patent_file_size"
    t.string   "enrollment_content_type"
    t.datetime "enrollment_updated_at"
    t.string   "enrollment_file_name"
    t.integer  "enrollment_file_size"
    t.string   "cei_content_type"
    t.datetime "cei_updated_at"
    t.string   "cei_file_name"
    t.integer  "cei_file_size"
    t.string   "gifp_content_type"
    t.datetime "gifp_updated_at"
    t.string   "gifp_file_name"
    t.integer  "gifp_file_size"
    t.string   "invoice_content_type"
    t.datetime "invoice_updated_at"
    t.string   "invoice_file_name"
    t.integer  "invoice_file_size"
    t.string   "inss_content_type"
    t.datetime "inss_updated_at"
    t.string   "inss_file_name"
    t.integer  "inss_file_size"
    t.string   "cnd_content_type"
    t.datetime "cnd_updated_at"
    t.string   "cnd_file_name"
    t.integer  "cnd_file_size"
    t.string   "dwell_content_type"
    t.datetime "dwell_updated_at"
    t.string   "dwell_file_name"
    t.integer  "dwell_file_size"
    t.string   "social_contract_content_type"
    t.datetime "social_contract_updated_at"
    t.string   "social_contract_file_name"
    t.integer  "social_contract_file_size"
    t.string   "avcb_content_type"
    t.datetime "avcb_updated_at"
    t.string   "avcb_file_name"
    t.integer  "avcb_file_size"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "work_documents", ["work_id"], :name => "index_work_documents_on_work_id"

  create_table "works", :force => true do |t|
    t.string   "cei"
    t.string   "name"
    t.string   "address"
    t.string   "number"
    t.string   "cep"
    t.integer  "state_id"
    t.integer  "city_id"
    t.string   "district"
    t.string   "adjunct"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_telephone"
    t.date     "date_initial"
    t.date     "issue_date"
    t.date     "dwell"
    t.date     "cnd"
    t.string   "status_dwell"
    t.string   "status_cnd"
    t.boolean  "email_dwell_warning",       :default => false
    t.boolean  "email_cnd_warning",         :default => false
    t.boolean  "email_dwell",               :default => false
    t.boolean  "email_cnd",                 :default => false
    t.string   "cost_center"
    t.string   "territorial"
    t.integer  "company_id"
    t.string   "footage"
    t.string   "responsible"
    t.string   "observation"
    t.string   "entry"
    t.string   "status"
    t.integer  "user_id"
    t.boolean  "demolition_check"
    t.string   "demolition_type"
    t.string   "demolition_km"
    t.boolean  "floor_check"
    t.integer  "floor_qtd"
    t.string   "floor_qtd_km"
    t.integer  "floor_units"
    t.string   "floor_units_km"
    t.integer  "floor_bathroom"
    t.string   "floor_bathroom_km"
    t.boolean  "home_check"
    t.integer  "home_club"
    t.string   "home_club_km"
    t.integer  "home_ordinance"
    t.string   "home_ordinance_km"
    t.integer  "home_support_ordinance"
    t.string   "home_support_ordinance_km"
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
  end

  add_index "works", ["city_id"], :name => "index_works_on_city_id"
  add_index "works", ["company_id"], :name => "index_works_on_company_id"
  add_index "works", ["state_id"], :name => "index_works_on_state_id"
  add_index "works", ["user_id"], :name => "index_works_on_user_id"

end
