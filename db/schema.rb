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

ActiveRecord::Schema.define(version: 20170321071400) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "publisher"
    t.string   "email"
    t.string   "confirm_email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country"
    t.string   "lang"
    t.string   "user_type"
    t.string   "role"
    t.string   "publishers"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "article_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role"
    t.string   "name"
    t.string   "desc"
    t.string   "format"
    t.string   "DOI"
    t.string   "BOA_country"
    t.string   "BOA_currency"
    t.string   "BOA_price"
    t.string   "BDP_country"
    t.string   "BDP_currency"
    t.string   "BDP_price"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "publisher"
    t.string   "DOI"
    t.string   "content_code"
    t.string   "jou_title"
    t.string   "article_type"
    t.string   "issue_type"
    t.string   "vol_no"
    t.string   "vol_title"
    t.string   "issue_no"
    t.string   "issue_supplement"
    t.string   "issue_number_begin"
    t.string   "issue_number_end"
    t.string   "access_level"
    t.string   "article_lang"
    t.string   "external_DRM"
    t.string   "article_sequence_number"
    t.string   "pub_date"
    t.string   "issue_cover_date"
    t.string   "stock_number"
    t.string   "abstract"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "books_content_pricings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "format"
    t.string   "ISBN"
    t.string   "DOI"
    t.string   "weight"
    t.string   "watermark_DRM"
    t.string   "external_DRM"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "books_contributors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role"
    t.string   "name"
    t.string   "description"
    t.string   "DOI"
    t.string   "DOD"
    t.string   "professional_position"
    t.string   "professional_affiliation"
    t.string   "website"
    t.string   "website_description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "books_primary_content_infos", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content_code"
    t.string   "publisher"
    t.string   "title"
    t.string   "sub_title"
    t.string   "ISBN"
    t.string   "lang"
    t.string   "content_classification"
    t.string   "file_name"
    t.string   "stock_number"
    t.string   "pub_site_sales_link"
    t.string   "blurb"
    t.string   "pub_date"
    t.string   "pub_month"
    t.integer  "pub_yesr"
    t.string   "conversion_req"
    t.string   "edition"
    t.string   "binding"
    t.string   "volume"
    t.string   "series_ISBN"
    t.string   "series_title"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "dimension"
  end

  create_table "books_seo_configs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "territorial_list_type"
    t.string   "territorial_list"
    t.string   "landing_page"
    t.string   "viewability_percentage"
    t.string   "exclude_pages_from_display"
    t.string   "total_free_pages_before_purchase"
    t.string   "total_free_page_before_login"
    t.string   "exclude_pages_from_external_index"
    t.string   "actual_pages_indexable"
    t.string   "actual_browsable_pages"
    t.string   "actual_printable"
    t.string   "actual_allowed_copying_pages"
    t.string   "internal_related_content"
    t.string   "related_content_identifier"
    t.string   "related_content_name"
    t.string   "related_content_url"
    t.string   "subject_group"
    t.string   "no_of_page"
    t.string   "free_matter"
    t.string   "first_page_of_full_text"
    t.string   "last_page_of_full_text"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
  end

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub"
    t.string   "campaign_name"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "institution_acc_billing_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "add_line2"
    t.string   "add_line3"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "country"
    t.string   "comments"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "institution_account_id"
  end

  create_table "institution_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub"
    t.string   "inst_ID"
    t.string   "Lib_name"
    t.string   "inst_name"
    t.string   "status"
    t.string   "display_name"
    t.string   "logo"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "institution_admin_user_accs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role"
    t.string   "publisher"
    t.string   "institution_name"
    t.string   "user_name"
    t.string   "status"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "position"
    t.string   "fax"
    t.string   "password"
    t.string   "confirm_password"
    t.string   "comments"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "journals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "jou_code"
    t.string   "publisher"
    t.string   "jou_title"
    t.string   "jou_subtitle"
    t.string   "jou_prim_ISSN"
    t.string   "jou_electronic_ISSN"
    t.string   "jou_owner"
    t.string   "lang"
    t.string   "jou_content_classification"
    t.string   "jou_distribution"
    t.string   "price_in"
    t.string   "journal_publisher_date"
    t.string   "stock_no"
    t.string   "cover_image"
    t.string   "jou_categories"
    t.string   "jou_desc"
    t.string   "editorial"
    t.string   "instructions_for_authors"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "license_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lic_group_ID"
    t.string   "lic_group_name"
    t.string   "pub"
    t.string   "created_on"
    t.string   "created_by"
    t.string   "lic_ID"
    t.string   "lic_name"
    t.string   "lic_type"
    t.string   "content_identifier"
    t.string   "from"
    t.string   "to"
    t.string   "purchase_infodiscount"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "lic_ID"
    t.string   "lic_name"
    t.string   "pub"
    t.string   "created_on"
    t.string   "created_by"
    t.string   "ISBN"
    t.string   "title"
    t.string   "lic_type"
    t.string   "from"
    t.string   "to"
    t.string   "discount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "models", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_models_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_models_on_reset_password_token", unique: true, using: :btree
  end

  create_table "print_houses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub"
    t.string   "print_house_code"
    t.string   "print_house_name"
    t.string   "ranking"
    t.string   "VAT_reg_no"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address_line1"
    t.string   "address_line2"
    t.string   "city"
    t.string   "state"
    t.string   "postal_code"
    t.string   "country"
    t.string   "shipping_type"
    t.string   "shipping_countries"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "promo_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub"
    t.string   "campaign"
    t.string   "no_of_promo_code"
    t.string   "applicable_discount"
    t.string   "from"
    t.string   "to"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub_code"
    t.string   "pub_name"
    t.string   "pub_status"
    t.string   "pub_type"
    t.string   "end_user_lang"
    t.string   "manager_lang"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "retailers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ret_code"
    t.string   "ret_name"
    t.string   "pub_id"
    t.string   "low_IP"
    t.string   "high_IP"
    t.string   "IP_list"
    t.string   "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subject_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "pub"
    t.string   "sub_group_level"
    t.string   "sub_group_code"
    t.string   "sub_group_name"
    t.string   "guest_user_view_limit"
    t.string   "auth_user_view_limit"
    t.string   "discount_percentage"
    t.string   "viewability_percentage"
    t.string   "select_lang"
    t.string   "desc"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subscription_ID"
    t.string   "subscription_name"
    t.string   "pub"
    t.string   "subscription_desc"
    t.string   "subscription_category"
    t.string   "sub_group_name"
    t.string   "sub_group_code"
    t.string   "subscription_type"
    t.string   "borrow_time"
    t.string   "no_of_books"
    t.string   "price"
    t.string   "currency"
    t.string   "discount_percentage"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
