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

ActiveRecord::Schema.define(version: 20170518125349) do

  create_table "admin_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country_code"
    t.string   "language"
    t.string   "user_type"
    t.string   "password"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "article_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "contributor_information_role"
    t.string   "contributor_information_name"
    t.string   "contributor_information_description"
    t.string   "content_format_type"
    t.date     "content_format_date_of_issue"
    t.string   "base_online_access_country"
    t.string   "base_online_access_currency"
    t.float    "base_online_access_price",            limit: 24
    t.string   "base_download_price_country"
    t.string   "base_download_price_currency"
    t.float    "base_download_price_price",           limit: 24
    t.integer  "article_id"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "articles", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.date     "date_of_issue"
    t.string   "content_code"
    t.string   "journal_title"
    t.string   "article_type"
    t.string   "issue_type"
    t.integer  "volume_number"
    t.string   "volume_title"
    t.integer  "issue_number"
    t.string   "issue_supplement"
    t.integer  "issue_number_begin"
    t.integer  "issue_number_end"
    t.string   "access_level"
    t.string   "article_language"
    t.string   "external_drm"
    t.integer  "article_sequence_number"
    t.date     "publication_date"
    t.date     "issue_cover_date"
    t.integer  "stock_number"
    t.string   "article_abstract"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "books_content_access_rules", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "territorial_list_type"
    t.string   "territorial_list"
    t.integer  "landing_page"
    t.float    "viewability_percentage",            limit: 24
    t.integer  "exclude_pages_from_display"
    t.integer  "total_free_pages_before_purchase"
    t.integer  "total_free_page_before_login"
    t.integer  "exclude_pages_from_external_index"
    t.integer  "actual_pages_indexable"
    t.integer  "actual_browsable_pages"
    t.integer  "actual_printable_pages"
    t.integer  "actual_allowed_copying_pages"
    t.string   "internal_related_content"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
  end

  create_table "books_content_pricings", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "format"
    t.integer  "isbn"
    t.date     "date_of_issue"
    t.float    "weight",        limit: 24
    t.string   "watermark_drm"
    t.string   "external_drm"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "books_contributors", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "contributor_role"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "description"
    t.date     "date_of_birth"
    t.date     "date_of_death"
    t.string   "professional_position"
    t.string   "professional_affiliation"
    t.string   "website"
    t.string   "website_description"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "books_metadata_uploads", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "attachment"
  end

  create_table "books_primary_content_informations", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "content_code"
    t.integer  "publisher_id"
    t.string   "book_title"
    t.string   "subject_title"
    t.integer  "isbn"
    t.string   "language"
    t.string   "content_classification"
    t.string   "file_name"
    t.integer  "stock_number"
    t.string   "publisher_site_sales_link"
    t.string   "book_blurb"
    t.integer  "publication_date"
    t.string   "publication_month"
    t.integer  "publication_year"
    t.string   "conversion_required"
    t.string   "edition"
    t.string   "binding"
    t.integer  "volume"
    t.integer  "series_isbn"
    t.string   "series_title"
    t.string   "dimension"
    t.integer  "license_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "campaigns", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.string   "campaign_name"
    t.string   "created_by"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "contacts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subject"
    t.string   "topic"
    t.string   "phone_number"
    t.integer  "fax_number"
    t.string   "comments"
    t.string   "email"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "countries", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "country_name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "end_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.string   "email"
    t.string   "password"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "country_code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "index_contents", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "content_code"
    t.string   "publisher_code"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "institution_account_billing_addresses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "phone"
    t.string   "email"
    t.string   "address"
    t.string   "address_line2"
    t.string   "address_line3"
    t.string   "city"
    t.string   "state"
    t.integer  "postal_code"
    t.string   "country_code"
    t.string   "comments"
    t.integer  "institution_account_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "institution_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.string   "library_name"
    t.string   "institution_name"
    t.string   "status"
    t.string   "display_name"
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "institution_admin_user_accounts", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "role"
    t.integer  "publisher_id"
    t.string   "institution_name"
    t.string   "user_name"
    t.string   "status"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "phone"
    t.string   "position"
    t.integer  "fax"
    t.string   "password"
    t.string   "comments"
    t.integer  "primary_count"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "journals", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "journal_code"
    t.integer  "publisher_id"
    t.string   "journal_title"
    t.string   "journal_subtitle"
    t.integer  "journal_primary_issn"
    t.integer  "journal_electronic_issn"
    t.string   "journal_owner"
    t.string   "language"
    t.string   "journal_content_classification"
    t.string   "journal_distribution"
    t.string   "price_in"
    t.date     "journal_publication_date"
    t.integer  "stock_number"
    t.string   "cover_image"
    t.string   "journal_categories"
    t.string   "journal_description"
    t.string   "editorial"
    t.string   "instructions_for_authors"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "library_users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "user_name"
    t.string   "password"
    t.string   "country_code"
    t.string   "status"
    t.string   "password_digest"
    t.integer  "institution_account_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "license_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "license_group_code"
    t.string   "license_group_name"
    t.integer  "publisher_id"
    t.string   "created_by"
    t.string   "license_id"
    t.string   "license_name"
    t.string   "license_type"
    t.string   "content_identifier"
    t.date     "valid_from"
    t.date     "valid_to"
    t.string   "purchase_information"
    t.float    "discount_percentage",  limit: 24
    t.string   "license_for_sale"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "licenses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "license_code"
    t.string   "license_name"
    t.integer  "publisher"
    t.string   "created_by"
    t.integer  "isbn"
    t.string   "title"
    t.string   "license_type"
    t.date     "valid_from"
    t.date     "valid_to"
    t.string   "license_for_sale"
    t.string   "license_is_linkable"
    t.date     "license_link_to_date"
    t.date     "license_link_from_date"
    t.string   "license_shipping_is_free"
    t.float    "license_discount_percentage", limit: 24
    t.integer  "license_group_id"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "member_publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "member_publisher_code"
    t.string   "member_publisher_name"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_email"
    t.string   "member_publisher_status"
    t.integer  "publisher_borrow_period"
    t.float    "revenue_share_percentage",           limit: 24
    t.integer  "publisher_id"
    t.string   "country_code"
    t.string   "member_publisher_logo_file_name"
    t.string   "member_publisher_logo_content_type"
    t.integer  "member_publisher_logo_file_size"
    t.datetime "member_publisher_logo_updated_at"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "promo_codes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.integer  "campaign_id"
    t.integer  "number_of_promo_code"
    t.float    "applicable_discount",  limit: 24
    t.date     "valid_from"
    t.date     "valid_to"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "publishers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "publisher_code"
    t.string   "publisher_name"
    t.string   "publisher_status"
    t.string   "publisher_type"
    t.string   "end_user_language"
    t.string   "manager_language"
    t.string   "contact_first_name"
    t.string   "contact_last_name"
    t.string   "contact_email"
    t.string   "country_code"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "retailers", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "retailer_code"
    t.string   "retailer_name"
    t.integer  "publisher_id"
    t.string   "low_ip"
    t.string   "high_ip"
    t.string   "ip_list"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "subject_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "publisher_id"
    t.integer  "subject_group_level"
    t.string   "subject_group_code"
    t.string   "subject_group_name"
    t.integer  "guest_user_view_limit"
    t.integer  "authentication_user_view_limit"
    t.float    "discount_percentage",            limit: 24
    t.float    "viewability_percentage",         limit: 24
    t.string   "language"
    t.string   "subject_group_description"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "subscription_for_books", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "subscription_id"
    t.integer  "publisher_id"
    t.integer  "title_id"
    t.boolean  "all_publisher"
    t.boolean  "all_title"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "subscription_for_subject_groups", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "subscription_id"
    t.integer  "subject_group_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "subscriptions", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "subscription_id"
    t.string   "subscription_name"
    t.integer  "publisher_id"
    t.string   "subscription_description"
    t.string   "subscription_category"
    t.string   "subscription_type"
    t.date     "agreement_form"
    t.date     "agreement_to"
    t.string   "available_for_institutional_account"
    t.integer  "purchase_information_number_of_books"
    t.float    "purchase_information_price",               limit: 24
    t.float    "purchase_information_discount_percentage", limit: 24
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

end
