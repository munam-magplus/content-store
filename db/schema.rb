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

ActiveRecord::Schema.define(version: 0) do

  create_table "CDP_ADDRESS", primary_key: "ADD_ADDRESS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "USE_USER_ID",                                                              null: false
    t.bigint   "AAD_TYPE_DOMAIN_ID",                                                       null: false
    t.string   "AAD_ADDRESS_LINE1",        limit: 50
    t.string   "AAD_ADDRESS_LINE2",        limit: 50
    t.string   "AAD_CITY",                 limit: 20
    t.string   "AAD_STATE_NAME",           limit: 20
    t.string   "AAD_ZIP_CODE",             limit: 10
    t.bigint   "PUY_PUBLISHER_COUNTRY_ID",                                                 null: false
    t.string   "AAD_TELEPHONE_NO",         limit: 10
    t.string   "DELETED_IND",              limit: 1,                                       null: false
    t.string   "CREATED_BY",               limit: 50,                                      null: false
    t.datetime "CREATED_DATE",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",           limit: 50,                                      null: false
    t.datetime "LASTUPDATED_DATE",                                                         null: false
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY2", using: :btree
    t.index ["USE_USER_ID", "AAD_TYPE_DOMAIN_ID"], name: "ADDRESS.USER_ID.TYPE_DOMAIN_ID.UK", unique: true, using: :btree
  end

  create_table "CDP_ADMIN_USER", primary_key: "USE_USER_ID", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "ADU_USER_CATEGORY", limit: 50, null: false
    t.index ["USE_USER_ID"], name: "ADU_EMAIL", unique: true, using: :btree
  end

  create_table "CDP_ARTICLE_CONTENT", primary_key: ["ARC_ARTICLE_ID", "COM_CONTENT_ID"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "ARC_ARTICLE_ID",                          null: false
    t.bigint  "COM_CONTENT_ID",                          null: false
    t.string  "ARC_LANGUAGES",               limit: 50
    t.integer "ARC_ARTICLE_PAGE_START"
    t.integer "ARC_ARTICLE_PAGE_END"
    t.string  "ARC_ARTICLE_SECTION",         limit: 70
    t.string  "ARC_ACCESS_LEVEL",            limit: 10,  null: false
    t.string  "ARC_COPYRIGHT_YEAR",          limit: 10
    t.string  "ARC_COPYRIGHT_NAME",          limit: 100
    t.integer "ARC_ARTICLE_SEQUENCE_NUMBER", limit: 2
    t.string  "ARC_RECEIVED_DATE",           limit: 20
    t.string  "ARC_ACCEPTED_DATE",           limit: 20
    t.string  "ARC_FULLTEXT_FILENAME",       limit: 300
    t.string  "ARC_DESIGNATION",             limit: 20,  null: false
    t.string  "ARC_EXTERNAL_DRM",            limit: 1
  end

  create_table "CDP_AUTH_IP", primary_key: "AUI_AUTH_IP_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "AUI_HIGH_IP",                                                        null: false
    t.bigint   "AUI_LOW_IP",                                                         null: false
    t.bigint   "INS_INSTITUTION_ID",                                                 null: false
    t.string   "CREATED_BY",         limit: 50,                                      null: false
    t.datetime "CREATED_DATE",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",     limit: 50,                                      null: false
    t.datetime "LASTUPDATED_DATE",                                                   null: false
    t.integer  "AUI_STATUS"
    t.string   "IP_LABEL",           limit: 30
    t.index ["INS_INSTITUTION_ID"], name: "RefCDP_USER5", using: :btree
  end

  create_table "CDP_AUTH_IP_HISTORY", primary_key: "AUI_AUTH_IP_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "AUI_HIGH_IP",                                                        null: false
    t.bigint   "AUI_LOW_IP",                                                         null: false
    t.bigint   "INS_INSTITUTION_ID",                                                 null: false
    t.string   "CREATED_BY",         limit: 50,                                      null: false
    t.datetime "CREATED_DATE",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",     limit: 50,                                      null: false
    t.datetime "LASTUPDATED_DATE",                                                   null: false
    t.integer  "AUI_STATUS"
    t.string   "IP_LABEL",           limit: 30
    t.bigint   "MAIL_SENT"
    t.string   "ACTION_PERFORMED",   limit: 10
    t.index ["INS_INSTITUTION_ID"], name: "RefCDP_USER5", using: :btree
  end

  create_table "CDP_BOOK_CONTENT", primary_key: "BOC_BOOK_CONT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",                                        null: false
    t.string "BOC_BOOK_ISBN",               limit: 13,                null: false
    t.string "BOC_BOOK_ISBN13",             limit: 13
    t.string "BOC_ALTERNATE_ISBN",          limit: 13
    t.string "BOC_SERIES_TITLE"
    t.string "BOC_SERIES_ISBN",             limit: 25
    t.string "BOC_BOOK_EDITION",            limit: 128
    t.string "BOC_FIRST_PAGE_OF_FULL_TEXT", limit: 10
    t.string "BOC_LAST_PAGE_OF_FULL_TEXT",  limit: 10
    t.string "BOC_BINDING_TYPE",            limit: 15
    t.string "BOC_FREE_MATTER",             limit: 500
    t.string "WATERMARKED_DRM",             limit: 1
    t.string "EXTERNAL_DRM",                limit: 1
    t.string "BOC_CHAPTER_PRICE_PERCENT",   limit: 3
    t.string "BOC_ONLINE_CONVERSION_REQ",   limit: 1,   default: "Y", null: false
    t.index ["BOC_BOOK_ISBN"], name: "BOC_BOOK_ISBN", unique: true, using: :btree
    t.index ["BOC_BOOK_ISBN13", "COM_CONTENT_ID", "BOC_BOOK_ISBN"], name: "BOOK_CONTENT.BOC_BOOK_ISBN13.UK", unique: true, using: :btree
    t.index ["BOC_BOOK_ISBN13"], name: "BOC_BOOK_ISBN13", unique: true, using: :btree
    t.index ["COM_CONTENT_ID"], name: "BOOK_CONTENT.CONTENT_ID.UK", unique: true, using: :btree
  end

  create_table "CDP_CAMPAIGN", primary_key: "CMP_CAMPAIGN_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                         null: false
    t.string   "CMP_CAMPAIGN_IDENTIFIER", limit: 50,                                       null: false
    t.string   "CMP_NAME",                limit: 100,                                      null: false
    t.string   "DELETED_IND",             limit: 1,   default: "N",                        null: false
    t.bigint   "USE_USER_ID",                                                              null: false
    t.datetime "CREATED_DATE"
    t.string   "LASTUPDATED_BY",          limit: 30,                                       null: false
    t.datetime "LASTUPDATED_DATE",                    default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "CDP_CART_LICENSE", primary_key: "CAL_CART_LICENSE", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USC_USER_CART",  null: false
    t.bigint "LIC_LICENSE_ID", null: false
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE169", using: :btree
    t.index ["USC_USER_CART", "LIC_LICENSE_ID"], name: "CART_LICENSE.USER_CART.LICENSE_ID.UK", unique: true, using: :btree
  end

  create_table "CDP_CHAPTER_CONTENT", primary_key: "CHC_CHAPTER_CONT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",                                   null: false
    t.string "CHC_CHAPTER_FIRST_PAGE", limit: 10
    t.string "CHC_CHAPTER_LAST_PAGE",  limit: 10
    t.string "CHC_CHAPTER_IDENTIFIER", limit: 100
    t.string "CHC_BLANK_PAGES",        limit: 100
    t.string "CHC_EXTERNAL_DRM",       limit: 1,   default: "N"
  end

  create_table "CDP_CITY", primary_key: "CDP_CITY_ID", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "CDP_COUNTY_ID",              null: false
    t.string  "CDP_CITY_NAME", limit: 250,  null: false
    t.string  "CDP_ZIPCODE",   limit: 2500, null: false
    t.index ["CDP_COUNTY_ID"], name: "CDP_COUNTY_ID", using: :btree
  end

  create_table "CDP_CONTENT", primary_key: "COM_CONTENT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                             null: false
    t.string   "LAN_LANGUAGE_ID",              limit: 50,                      null: false
    t.string   "COM_DOI_CODE",                 limit: 50
    t.string   "COM_CONTENT_STATUS",           limit: 23
    t.string   "COM_CONTENT_CODE",             limit: 100
    t.string   "COM_CODE",                     limit: 100
    t.string   "COM_TITLE",                    limit: 500,                     null: false
    t.string   "COM_SUB_TITLE",                limit: 500
    t.text     "COM_BLURB",                    limit: 65535
    t.bigint   "COM_TYPE_DOMAIN_ID",                                           null: false
    t.string   "COM_TERRITORIAL_RIGHTS_TYPE",  limit: 3,     default: "INC",   null: false
    t.string   "COM_TERRITORIES_CODES",        limit: 500,   default: "ALL"
    t.string   "COM_RESTRICED_UNITS",          limit: 500
    t.integer  "COM_TOTAL_CONTENT_UNITS"
    t.string   "COM_CONTENT_MEASUREMENT_UNIT", limit: 15,    default: "PAGES", null: false
    t.string   "COM_PUBLICATION_DATE",         limit: 20
    t.string   "COM_VOLUME",                   limit: 32
    t.integer  "COM_GUEST_USER_ACCESS_LIMIT"
    t.integer  "COM_AUTH_USER_ACCESS_LIMIT"
    t.integer  "COM_VIEWING_LIMIT_PERCENTAGE", limit: 2
    t.string   "COM_PUB_SITE_SALES_LINK",      limit: 512
    t.string   "COM_THUMBNAIL_IMAGE_PATH"
    t.string   "COM_PHYSICAL_DIM",             limit: 32
    t.bigint   "PIM_PUB_IMPRINT_ID"
    t.string   "COM_COMMODITY_CODE",           limit: 50
    t.string   "COM_BISAC_CODE",               limit: 50
    t.string   "COM_EXC_INDEXING_UNITS",       limit: 256
    t.string   "DELETED_IND",                  limit: 1,                       null: false
    t.string   "CREATED_BY",                   limit: 50,                      null: false
    t.datetime "CREATED_DATE"
    t.datetime "LASTUPDATED_DATE"
    t.string   "LASTUPDATED_BY",               limit: 50,                      null: false
    t.string   "COM_LANDING_PAGE",             limit: 20,    default: "BI"
    t.string   "COM_CLASSIFICATION",           limit: 50
    t.integer  "COM_CLASSIFICATION_ORDER"
    t.string   "COM_IS_INDEXED",               limit: 1,     default: "N",     null: false
    t.datetime "COM_INDEX_CREATION_DATE"
    t.string   "LSI_STATUS",                   limit: 20
    t.string   "COM_INTERNAL_RELATED_CONTENT", limit: 45
    t.string   "COM_EXTERNAL_RELATED_CONTENT", limit: 1000
    t.bigint   "COM_PARENT_CONTENT_ID"
    t.bigint   "VOI_VOL_ISSUE_ID"
    t.datetime "CROSSREF_LASTUPDATED_DATE"
    t.string   "COM_STOCK_NUMBER",             limit: 50
    t.string   "COM_SEO_KEYWORDS",             limit: 1000,                                 collation: "utf8_bin"
    t.string   "COM_SEO_DESCRIPTION",          limit: 3000,                                 collation: "utf8_bin"
    t.index ["COM_CLASSIFICATION"], name: "COM_CLASSIFICATION", using: :btree
    t.index ["COM_CONTENT_CODE"], name: "COM_CONTENT_CODE", unique: true, using: :btree
    t.index ["COM_CONTENT_STATUS"], name: "COM_CONTENT_STATUS", using: :btree
    t.index ["COM_DOI_CODE"], name: "COM_DOI_CODE", unique: true, using: :btree
    t.index ["COM_DOI_CODE"], name: "CONTENT.DOI_CODE.UK", unique: true, using: :btree
    t.index ["LAN_LANGUAGE_ID"], name: "RefCDP_LANGUAGE116", using: :btree
    t.index ["PIM_PUB_IMPRINT_ID"], name: "RefCDP_PUBLISHER_IMPRINTS119", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER114", using: :btree
  end

  create_table "CDP_CONTENT_ADD_FIELD", primary_key: "CFD_FIELD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                            null: false
    t.string   "CFD_FIELD_TYPE",             limit: 20
    t.bigint   "CFD_CONTENT_TYPE_DOMAIN_ID"
    t.string   "CFD_FIELD_NAME",             limit: 100,                                      null: false
    t.string   "CFD_FIELD_LENGTH",           limit: 10
    t.string   "DELETED_IND",                limit: 1,                                        null: false
    t.string   "CREATED_BY",                 limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",             limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE",                                                            null: false
    t.string   "SHORT_DESC",                 limit: 256
    t.index ["PUB_PUBLISHER_ID", "CFD_CONTENT_TYPE_DOMAIN_ID", "CFD_FIELD_NAME"], name: "PUBLISHER_ID.CONTENT_TYPE.FIELD_NAME.U", unique: true, using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER159", using: :btree
  end

  create_table "CDP_CONTENT_ADD_FIELD_VALUE", primary_key: "CFV_CONT_ADD_FIELD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                    null: false
    t.bigint   "CPE_FIELD_ID"
    t.string   "CFV_FIELD_VALUE",  limit: 256
    t.string   "CREATED_BY",       limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",   limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE",                                                  null: false
    t.index ["COM_CONTENT_ID"], name: "RefCDP_CONTENT156", using: :btree
    t.index ["CPE_FIELD_ID", "COM_CONTENT_ID"], name: "CONTENT_ADD_FIELD_VALUE.FIELD_ID.CONTENT_ID.UK", unique: true, using: :btree
  end

  create_table "CDP_CONTENT_CLASSIFICATION", primary_key: "CCN_CLASSIFICATION_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "INSTITUTION_ID"
    t.bigint "CONTENT_ID",     null: false
    t.bigint "PUBLISHER_ID"
  end

  create_table "CDP_CONTENT_CONTRIBUTOR", primary_key: "COC_CONTRIBUTOR_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                                     null: false
    t.string   "COC_NAME_PREFIX",              limit: 25
    t.string   "COC_FIRST_NAME",               limit: 100
    t.string   "COC_LAST_NAME",                limit: 100
    t.string   "COC_NAME_SUFFIX",              limit: 25
    t.integer  "COC_ORDER",                    limit: 2,        default: 1,                          null: false
    t.string   "COC_WEB_SITE",                 limit: 512
    t.string   "COC_BLOG_URL",                 limit: 512
    t.text     "COC_BIOGRAPHICAL_NOTES",       limit: 16777215
    t.text     "COC_DESCRIPTION",              limit: 16777215
    t.string   "COC_ROLE",                     limit: 1000
    t.string   "COC_STATEMENT",                limit: 512
    t.string   "AUDIT_CRE_USER",               limit: 30
    t.datetime "AUDIT_CRE_DATE",                                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "AUDIT_UPD_DATE"
    t.string   "AUDIT_UPD_USER",               limit: 30
    t.string   "COC_PERSON_DATE",              limit: 1000
    t.string   "COC_PROFESSIONAL_POSITION",    limit: 1000
    t.string   "COC_PROFESSIONAL_AFFILIATION", limit: 1000
    t.string   "COC_EMAIL",                    limit: 1000
    t.string   "COC_ADDRESS_CORRESPONDENCE",   limit: 500
    t.index ["COC_CONTRIBUTOR_ID"], name: "index_CDP_CONTENT_CONTRIBUTOR", using: :btree
    t.index ["COM_CONTENT_ID"], name: "COM_CONTENT_ID", using: :btree
  end

  create_table "CDP_CONTENT_FORMAT", primary_key: "COF_CONTENT_FORMAT_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                                                      null: false
    t.string   "COF_FORMAT",                limit: 10,                                                                null: false
    t.string   "COF_FORMAT_IDENTIFIER",     limit: 100,                          default: "NA"
    t.string   "COF_FORMAT_DURATION_VALUE", limit: 5,                            default: "NA"
    t.string   "COF_FORMAT_DURATION_UNIT",  limit: 20,                           default: "NA"
    t.decimal  "COF_CONTENT_SIZE",                      precision: 10, scale: 2,                                      null: false
    t.string   "COF_SIZE_MEASUREMENT_UNIT", limit: 10
    t.string   "COF_FORMAT_ISBN",           limit: 10
    t.string   "COF_FORMAT_ISBN13",         limit: 30
    t.string   "COF_FORMAT_DOI",            limit: 50
    t.decimal  "COF_FORMAT_WEIGHT",                     precision: 10, scale: 2
    t.string   "COF_FORMAT_WEIGHT_TYPE",    limit: 10
    t.string   "SHORT_DESC",                limit: 256
    t.string   "AUDIT_CRE_USER",            limit: 30
    t.datetime "AUDIT_CRE_DATE",                                                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "AUDIT_UPD_DATE"
    t.string   "AUDIT_UPD_USER",            limit: 30
    t.string   "LSI_STATUS",                limit: 20
    t.string   "SKU",                       limit: 15
    t.index ["COM_CONTENT_ID", "COF_FORMAT", "COF_FORMAT_DURATION_VALUE", "COF_FORMAT_DURATION_UNIT"], name: "COM_CONTENT_ID", unique: true, using: :btree
    t.index ["LSI_STATUS"], name: "INDEX_LSI", using: :btree
  end

  create_table "CDP_CONTENT_ISSUE", primary_key: "CIT_ISSUE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                       null: false
    t.string   "USE_USER_ID",    limit: 20,                                            null: false
    t.string   "CIT_USER_NAME",  limit: 70
    t.string   "CIT_USER_TYPE",  limit: 30,       default: "CTS_SUPER_ADMIN"
    t.string   "CIT_EMAIL",      limit: 70
    t.datetime "CREATED_DATE",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text     "CIT_COMMENTS",   limit: 16777215
  end

  create_table "CDP_CONTENT_LANGUAGE_INFO", primary_key: ["CLI_CONTENT_LANGUAGE_ID", "COM_CONTENT_ID"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "CLI_CONTENT_LANGUAGE_ID",              null: false
    t.bigint "COM_CONTENT_ID",                       null: false
    t.string "CLI_LANGUAGE_CODE",       limit: 10,   null: false
    t.string "CLI_CONTENT_TITLE",       limit: 500
    t.string "CLI_KEYWORDS",            limit: 1000
  end

  create_table "CDP_CONTENT_LICENSE", primary_key: "COL_CONTENT_LICENSE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID"
    t.bigint "SUG_GROUP_ID"
    t.bigint "LIC_LICENSE_ID",                                        null: false
    t.string "COL_LICENSE_GRANULARITY", limit: 20,                    null: false
    t.string "COL_LICENSE_CATEGORY",    limit: 10, default: "SINGLE", null: false
    t.string "COL_CONTENT_TYPE",        limit: 32
  end

  create_table "CDP_CONTENT_LICENSE_REQUEST", primary_key: "REQ_COL_CONTENT_LICENSE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID"
    t.bigint "SUG_GROUP_ID"
    t.bigint "REQ_LIC_LICENSE_ID",                                        null: false
    t.string "REQ_COL_LICENSE_GRANULARITY", limit: 20,                    null: false
    t.string "REQ_COL_LICENSE_CATEGORY",    limit: 10, default: "SINGLE", null: false
    t.string "REQ_COL_CONTENT_TYPE",        limit: 32
  end

  create_table "CDP_CONTENT_PARTNERS", primary_key: "CSP_CONTENT_PARTNER_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "COM_CONTENT_ID"
    t.bigint  "PUB_PUBLISHER_ID"
    t.bigint  "TPP_PARTNERS_ID",                            null: false
    t.integer "CSP_ORDER",                                  null: false
    t.string  "CSP_CONTENT_ID_TYPE",            limit: 10
    t.string  "CSP_CONTENT_ID_TYPE_VALUE",      limit: 25
    t.integer "CSP_BROWSABLE_UNITS_PERCENTAGE", limit: 2
    t.string  "CSP_ACTUAL_BROWSABLE_UNITS",     limit: 256
    t.integer "CSP_PRINTABLE_UNITS_PERCENTAGE", limit: 2
    t.string  "CSP_ACTUAL_PRINTABLE_UNITS",     limit: 256
    t.integer "CSP_COPYING_UNITS_PERCENTAGE",   limit: 2
    t.string  "CSP_ACTUAL_COPYING_UNITS",       limit: 256
    t.string  "CSP_SHOW_PARTNER_ADVERTISEMENT", limit: 1
    t.index ["COM_CONTENT_ID", "TPP_PARTNERS_ID"], name: "CONTENT_PARTNERS.CONTENT_ID.PARTNER_ID.UK", unique: true, using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER119", using: :btree
    t.index ["TPP_PARTNERS_ID"], name: "RefCDP_THIRD_PARTY_PARTNERS119", using: :btree
  end

  create_table "CDP_CONTENT_PRICE", primary_key: "COE_CONT_PRICE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID"
    t.bigint   "PUY_PUBLISHER_COUNTRY_ID"
    t.bigint   "CUR_CURRENCY_ID",                                                                                   null: false
    t.integer  "COF_CONTENT_FORMAT_ID"
    t.decimal  "COE_CONTENT_PRICE",                   precision: 10, scale: 2,                                      null: false
    t.bigint   "COE_PRICE_TYPE_DOMAIN_ID"
    t.date     "COE_PRICE_EFFECTIVE_FROM"
    t.date     "COE_PRICE_EFFECTIVE_TO"
    t.string   "CREATED_BY",               limit: 50,                                                               null: false
    t.datetime "CREATED_DATE",                                                 default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",           limit: 50,                                                               null: false
    t.datetime "LASTUPDATED_DATE",                                                                                  null: false
    t.index ["COF_CONTENT_FORMAT_ID"], name: "RefCDP_CONTENT_PRICE119", using: :btree
    t.index ["COM_CONTENT_ID"], name: "RefCDP_CONTENT175", using: :btree
    t.index ["CUR_CURRENCY_ID", "COE_PRICE_TYPE_DOMAIN_ID", "COM_CONTENT_ID", "PUY_PUBLISHER_COUNTRY_ID", "COF_CONTENT_FORMAT_ID"], name: "CONTENT_PRICE.CURRENCY_ID.CONTENT_ID.COUNTRY_ID.PRICE_TYPE.UK", unique: true, using: :btree
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY239", using: :btree
  end

  create_table "CDP_CONTENT_RESTRICTED", primary_key: "ISBN", id: :string, limit: 13, default: "", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "RESTRICTED_PAGES", limit: 500
  end

  create_table "CDP_CONTENT_REVIEW", primary_key: "COR_CONTENT_REVIEW_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                           null: false
    t.bigint   "USE_USER_ID",                                                              null: false
    t.text     "COR_REVIEW_COMMENT", limit: 16777215
    t.integer  "COR_REVIEW_RATING",  limit: 2
    t.string   "COR_REVIEW_STATUS",  limit: 8,                                             null: false
    t.datetime "CREATED_DATE",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "CDP_CONTENT_STATIC_DATA", primary_key: "COM_COS_CONTENT_STATIC_DATA_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",                         null: false
    t.bigint "LAN_LANGUAGE_ID",                        null: false
    t.string "COS_STATIC_DATA_CATEGORY", limit: 50
    t.string "COS_STATIC_DATA_KEY",      limit: 50
    t.text   "COS_STATIC_DATA_TEXT",     limit: 65535
    t.string "COS_STATIC_DATA_ORDER",    limit: 20
    t.string "SHORT_DESC",               limit: 50
  end

  create_table "CDP_CONTENT_SUBJECT", primary_key: "COT_CONTENT_SUBJECT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "CJT_GROUP_ID",   null: false
    t.bigint "COM_CONTENT_ID", null: false
    t.index ["CJT_GROUP_ID", "COM_CONTENT_ID"], name: "CONTENT_SUBJECT.GROUP_ID.CONTENT_ID", unique: true, using: :btree
    t.index ["COM_CONTENT_ID"], name: "RefCDP_CONTENT139", using: :btree
  end

  create_table "CDP_CONTENT_SUPPLEMENT", primary_key: "SUP_SUPPLEMENT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",                         null: false
    t.string "SUP_SUPPLEMENT_NAME",      limit: 100
    t.string "SUP_SUPPLEMENT_SIZE",      limit: 10
    t.string "SUP_SUPPLEMENT_FILE_TYPE", limit: 10
    t.string "SUP_SUPPLEMENT_SIZE_UNIT", limit: 20
    t.string "SUP_LOCATION",             limit: 250
    t.text   "SUP_DESCRIPTION",          limit: 65535
  end

  create_table "CDP_COUNTRY", primary_key: "COI_COUNTRY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "COUNTRY_CODE", limit: 5
  end

  create_table "CDP_COUNTRY_NAME", primary_key: "CON_COUNTRY_NAME_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "CON_COUNTRY_ID",                            null: false
    t.bigint "CON_LANGUAGE_ID",                           null: false
    t.string "CON_COUNTRY_NAME", limit: 100, default: "", null: false
    t.index ["CON_COUNTRY_ID", "CON_LANGUAGE_ID"], name: "XUK_CDP_COM_CURRENCY", unique: true, using: :btree
  end

  create_table "CDP_COUNTRY_STATE", primary_key: "COS_COUNTRY_STATE_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "PUY_PUBLISHER_COUNTRY_ID",             null: false
    t.string  "COS_STATE_CODE",           limit: 10,  null: false
    t.string  "COS_STATE_NAME",           limit: 200, null: false
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY", using: :btree
  end

  create_table "CDP_COUNTY", primary_key: "CDP_COUNTY_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "COS_COUNTRY_STATE_ID"
    t.string  "CDP_COUNTY_NAME",      limit: 25
    t.index ["CDP_COUNTY_ID"], name: "CDP_COUNTY_ID", unique: true, using: :btree
  end

  create_table "CDP_CROSSREF_CRON_JOB", primary_key: "ID", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.integer  "PUBLISHER_ID",                                                       null: false
    t.string   "PUBLISHER_NAME",    limit: 100
    t.datetime "START_TIME",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "END_TIME",                                                           null: false
    t.datetime "LAST_UPDATED_DATE",                                                  null: false
    t.integer  "NUMBER_OF_TITLES",                                                   null: false
  end

  create_table "CDP_CURRENCY", primary_key: "CUR_CURRENCY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "CUR_CURRENCY_SYMBOL", limit: 20, null: false
  end

  create_table "CDP_CURRENCY_NAME", primary_key: "CUN_CURRENCY_NAME_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "CUN_CURRENCY_ID",                            null: false
    t.bigint "CUN_LANGUAGE_ID",                            null: false
    t.string "CUN_CURRENCY_NAME", limit: 100, default: "", null: false
    t.index ["CUN_CURRENCY_ID", "CUN_LANGUAGE_ID"], name: "XUK_CDP_COM_CURRENCY", unique: true, using: :btree
  end

  create_table "CDP_DOMAIN", primary_key: "DOM_DOMAIN_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "DOM_DOMAIN_CATEGORY",    limit: 50,                        null: false
    t.string "DOM_DOMAIN_KEY",         limit: 500,                       null: false
    t.text   "DOM_DOMAIN_VALUE",       limit: 16777215,                  null: false
    t.string "DOM_LOCALE",             limit: 10
    t.string "DOM_DISPLAY_NAME",       limit: 256
    t.string "DOM_DOMAIN_FORMAT_TYPE", limit: 50,       default: "text", null: false
    t.string "DOM_DESCRIPTION",        limit: 1000
    t.index ["DOM_DOMAIN_CATEGORY", "DOM_LOCALE"], name: "DOM_LOCALE", using: :btree
  end

  create_table "CDP_ECOMMERCE_TRANSACTION", primary_key: "ECT_TRANSACTION_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.text     "ECT_PAYMENT_GATEWAY_RESPONSE", limit: 16777215
    t.string   "ECT_TRANS_ORDER_ID",           limit: 50,                                                                     null: false
    t.datetime "ECT_TRANSACTION_DATE",                                                   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "ECT_REQUEST_CODE",             limit: 25
    t.decimal  "ECT_ACTUAL_AMOUNT",                             precision: 10, scale: 2
    t.decimal  "ECT_TRANSACTION_AMOUNT",                        precision: 10, scale: 2
    t.decimal  "ECT_TAX_AMOUNT",                                precision: 10, scale: 2
    t.integer  "ECT_REASON_CODE"
    t.string   "ECT_TRANSACTION_TYPE",         limit: 25,                                                                     null: false
    t.string   "ECT_TAX_NUMBER",               limit: 15
    t.string   "ECT_CREDIT_CARD_NUMBER",       limit: 500
    t.string   "ECT_CREDIT_CARD_CODE",         limit: 5
    t.bigint   "CUR_CURRENCY_ID"
    t.string   "ECT_CC_NAME",                  limit: 100,                                                                    null: false
    t.string   "ECT_ADDRESS_LINE_ONE",         limit: 50,                                                                     null: false
    t.string   "ECT_ADDRESS_LINE_TWO",         limit: 50
    t.string   "ECT_CITY",                     limit: 50,                                                                     null: false
    t.string   "ECT_ZIPCODE",                  limit: 25,                                                                     null: false
    t.string   "ECT_STATE",                    limit: 50,                                                                     null: false
    t.string   "ECT_COUNTRY_CODE",             limit: 20,                                                                     null: false
    t.string   "CREATED_BY",                   limit: 50,                                                                     null: false
    t.datetime "CREATED_DATE"
    t.string   "LASTUPDATED_BY",               limit: 50,                                                                     null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "SHORT_DESC",                   limit: 256
    t.string   "ECT_COUNTY",                   limit: 50
    t.string   "EXPIRY_DATE",                  limit: 50
    t.string   "ECT_USER_NAME",                limit: 100
    t.string   "ECT_PHONE",                    limit: 30
    t.string   "ECT_EMAIL",                    limit: 100
    t.bigint   "USE_USER_ID"
    t.string   "ECT_TRANSACTON_LOCALE",        limit: 5,                                 default: "en"
    t.bigint   "CPC_PROMOCODE_ID"
    t.index ["CPC_PROMOCODE_ID"], name: "CPC_PROMOCODE_ID", using: :btree
    t.index ["CUR_CURRENCY_ID"], name: "RefCDP_CURRENCY119", using: :btree
  end

  create_table "CDP_EMAIL_ALERT_USER", primary_key: "EAU_USER_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string "EAU_EMAIL",        limit: 150
    t.bigint "PUB_PUBLISHER_ID",             null: false
  end

  create_table "CDP_EMAIL_TEMPLATE", primary_key: "EMT_TEMPLATE_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                               null: false
    t.string   "LAN_LANGUAGE_ID",          limit: 50,                                            null: false
    t.string   "EMT_EVENT",                limit: 40,                                            null: false
    t.string   "EMT_EMAIL_FROM",                                                                 null: false
    t.string   "EMT_EMAIL_SUBJECT",        limit: 100,                                           null: false
    t.text     "EMT_EMAIL_BODY",           limit: 16777215,                                      null: false
    t.string   "EMT_EMAIL_SIGNATURE",      limit: 100
    t.text     "EMT_EMAIL_COPYRIGHT_TEXT", limit: 16777215
    t.string   "EMT_TEMPLATE_PARAMETERS",  limit: 500
    t.string   "CREATED_BY",               limit: 50,                                            null: false
    t.datetime "CREATED_DATE",                              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",           limit: 50,                                            null: false
    t.datetime "LASTUPDATED_DATE",                                                               null: false
    t.string   "SHORT_DESC",               limit: 256
    t.string   "EMT_EMAIL_CC",                                                                   null: false
    t.string   "EMT_EMAIL_BCC",                                                                  null: false
    t.index ["LAN_LANGUAGE_ID"], name: "RefCDP_LANGUAGE246", using: :btree
    t.index ["PUB_PUBLISHER_ID", "LAN_LANGUAGE_ID", "EMT_EVENT"], name: "EMAIL_TEMPLATE.PUB.LANGUAGE.ACTION.UK", unique: true, using: :btree
  end

  create_table "CDP_EXCHANGE_RATE", primary_key: "EXR_EXCHANGE_RATE_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "EXR_BASE_CURRENCY_ID",                                      null: false
    t.bigint   "EXR_LOCAL_CURRENCY_ID",                                     null: false
    t.decimal  "EXR_EXCHANGE_RATE",                precision: 10, scale: 2, null: false
    t.datetime "CREATED_DATE",                                              null: false
    t.string   "CREATED_BY",            limit: 50,                          null: false
    t.datetime "LASTUPDATED_DATE",                                          null: false
    t.string   "LASTUPDATED_BY",        limit: 50,                          null: false
    t.index ["EXR_BASE_CURRENCY_ID"], name: "RefCDP_CURRENCY119", using: :btree
    t.index ["EXR_LOCAL_CURRENCY_ID"], name: "RefCDP_CURRENCY120", using: :btree
  end

  create_table "CDP_FEED", primary_key: "FEED_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.string   "FEED_NAME",           limit: 100,                                        null: false
    t.datetime "FEED_EXECUTION_TIME",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "FEED_STATUS",         limit: 50,                                         null: false
    t.text     "COMMENTS",            limit: 65535
  end

  create_table "CDP_INDEXING_REPORT", primary_key: "CDP_INDEX_REPORT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "CDP_PUBLISHER_ID",       limit: 2
    t.binary   "CDP_CONTENT_CODE",       limit: 100
    t.integer  "CDP_INDEXING_OPERATION", limit: 2
    t.text     "CDP_INDEX_STATUS",       limit: 4294967295
    t.datetime "CDP_INDEXING_DATE"
  end

  create_table "CDP_INDEX_LOGS", primary_key: "INDEX_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin" do |t|
    t.datetime "EXECUTION_DATE",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint   "COM_CONTENT_ID"
    t.bigint   "PUB_PUBLISHER_ID"
    t.integer  "INDEX_OPERATION"
    t.string   "INDEX_DONE",        limit: 1,        default: "N"
    t.string   "REQUEST_ID",        limit: 100
    t.text     "ERROR_DESCRIPTION", limit: 16777215
  end

  create_table "CDP_INSTITUTION_CONTENT_ACCESS", primary_key: "ICA_INSTITUTION_CONTENT_ACCESS_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1" do |t|
    t.string   "ICA_CONTENT_FORMAT", limit: 50,                                       null: false
    t.string   "ICA_ROLE_NAME",      limit: 100,                                      null: false, collation: "utf8_general_ci"
    t.boolean  "ICA_IS_ALLOWED",                                                      null: false
    t.bigint   "INS_INSTITUTION_ID",                                                  null: false
    t.string   "CREATED_BY",         limit: 50
    t.datetime "CREATED_DATE",                   default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",     limit: 50
    t.datetime "LASTUPDATED_DATE",                                                    null: false
    t.index ["ICA_CONTENT_FORMAT", "ICA_ROLE_NAME", "ICA_IS_ALLOWED", "INS_INSTITUTION_ID"], name: "UNIQUE_KEY", unique: true, using: :btree
    t.index ["INS_INSTITUTION_ID"], name: "FK_CDP_INSTITUTION_CONTENT_ALLOWED", using: :btree
  end

  create_table "CDP_INSTITUTION_DETAILS", primary_key: "INS_INSTITUTION_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "INS_INSTITUTION_CODE",     limit: 40,  default: "",                         null: false
    t.string   "INS_LIB_DEPT_NAME",        limit: 30,  default: "",                         null: false
    t.string   "INS_INSTITUTION_NAME",     limit: 50
    t.string   "INS_INSTITUTION_STATUS",   limit: 8,                                        null: false
    t.string   "INS_DISPLAY_NAME",         limit: 75
    t.string   "INS_LOGO",                 limit: 100
    t.string   "INS_FIRST_NAME",           limit: 30
    t.string   "INS_LAST_NAME",            limit: 30
    t.string   "INS_PHONE_NUMBER",         limit: 20
    t.string   "INS_EMAIL_ID",             limit: 50
    t.string   "INS_ADDRESS"
    t.string   "INS_ADDRESS_LINE2",        limit: 100
    t.string   "INS_ADDRESS_LINE3",        limit: 100
    t.string   "INS_CITY",                 limit: 50
    t.string   "INS_STATE",                limit: 50
    t.string   "INS_POSTAL_CODE",          limit: 20
    t.bigint   "PUY_PUBLISHER_COUNTRY_ID"
    t.string   "INS_COMMENTS"
    t.integer  "INS_FURTHER_INFO_REQD",    limit: 2
    t.string   "INS_PUB_INSTITUTION_ID",   limit: 30
    t.bigint   "PUB_PUBLISHER_ID"
    t.bigint   "INS_PARENT_INST_ID",                                                        null: false
    t.string   "CREATED_BY",               limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                         default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",           limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE",                                                          null: false
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "INS_COUNTRY", using: :btree
  end

  create_table "CDP_INSTITUTION_SUBSCRIPTION", primary_key: "INN_INST_SUBSCRIPTION_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "INS_INSTITUTION_ID",                                                 null: false
    t.bigint   "LIC_LICENSE_ID",                                                     null: false
    t.bigint   "ECT_TRANSACTION_ID"
    t.integer  "INN_CONCURRENT_USAGE_LIMIT"
    t.datetime "INN_START_DATE"
    t.datetime "INN_END_DATE"
    t.string   "INN_SUBSCRIPTION_STATUS",       limit: 10
    t.string   "INN_SALES_PERSON_NAME",         limit: 100
    t.string   "INN_SALES_PERSON_EMAIL",        limit: 50
    t.bigint   "CUR_CURRENCY_ID"
    t.decimal  "INN_ACTUAL_AMOUNT",                         precision: 10, scale: 2
    t.decimal  "INN_DISCOUNT",                              precision: 10, scale: 2
    t.string   "INN_RENEWAL_OPTION",            limit: 1
    t.decimal  "INN_PRICING_CAP",                           precision: 10, scale: 2
    t.string   "INN_REMINDER_EMAIL_TO",         limit: 10
    t.integer  "INN_REMINDER_DAYS"
    t.string   "INN_COMMENTS",                  limit: 256
    t.bigint   "INN_PREV_INST_SUBSCRIPTION_ID"
    t.datetime "INN_TRANSACTION_DATE"
  end

  create_table "CDP_INSTITUTION_USER_DETAILS", primary_key: "IUS_USER_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "IUS_POSITION", limit: 100
    t.bigint "USE_USER_ID",              null: false
    t.string "IUS_PHONE",    limit: 50
    t.string "IUS_FAX",      limit: 50
    t.string "IUS_COMMENTS", limit: 500
  end

  create_table "CDP_JOURNAL_CONTENT", primary_key: ["JOC_JOURNAL_CONT_ID", "COM_CONTENT_ID"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "JOC_JOURNAL_CONT_ID",                null: false
    t.bigint "COM_CONTENT_ID",                     null: false
    t.string "JOC_JOUR_PISSN",       limit: 20
    t.string "JOC_CODE",             limit: 10,    null: false
    t.string "JOC_ABBREVIATION",     limit: 10
    t.string "JOC_JOUR_EISSN",       limit: 20
    t.string "JOC_OWNER",            limit: 75
    t.string "JOC_DISTRIBUTORS",     limit: 75
    t.string "JOC_ISSUE_FREQUENCY",  limit: 20
    t.bigint "JOC_CURRENT_ISSUE_ID"
    t.text   "JOC_DESCRIPTION",      limit: 65535
  end

  create_table "CDP_LANGUAGE", primary_key: "LAN_LANGUAGE_ID", id: :string, limit: 50, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "LAN_LANGUAGE_CODE",     limit: 10
    t.string "LAN_LANGUAGE_ISO_CODE", limit: 10
  end

  create_table "CDP_LANGUAGE_NAME", primary_key: "LAN_LANGUAGE_NAME_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "LAN_LANGUAGE_ID",                            null: false
    t.string "LAN_LANGUAGE_NAME", limit: 100, default: "", null: false
    t.string "LAN_LANGUAGE_CODE", limit: 10,               null: false
  end

  create_table "CDP_LICENSE", primary_key: "LIC_LICENSE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "LIT_LICENSE_TEMPLATE_ID"
    t.bigint   "PUB_PUBLISHER_ID",                                                                                         null: false
    t.string   "LIC_IS_FREE",                    limit: 1,                                                                 null: false
    t.bigint   "LIC_LICENSE_TYPE_DOMAIN_ID",                                                                               null: false
    t.string   "LIC_IS_LINKABLE",                limit: 1,                                                                 null: false
    t.date     "LIC_LINK_FROM_DATE"
    t.date     "LIC_LINK_TO_DATE"
    t.string   "LIC_FOR_SALE",                   limit: 1,                                                                 null: false
    t.string   "DELETED_IND",                    limit: 1,                                                                 null: false
    t.string   "CREATED_BY",                     limit: 50,                                                                null: false
    t.datetime "CREATED_DATE",                                                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",                 limit: 50,                                                                null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "SHORT_DESC",                     limit: 256
    t.string   "LIC_LICENSE_CODE",               limit: 100,                                                               null: false
    t.string   "LIC_LICENSE_NAME",               limit: 100,                                                               null: false
    t.string   "LIC_PUB_IDENTIFIER",             limit: 30
    t.string   "LIC_ISBN_IDENTIFIER",            limit: 30
    t.datetime "LIC_START_DATE"
    t.datetime "LIC_END_DATE"
    t.integer  "LIC_DURATION"
    t.string   "LIC_DURATION_UNITS",             limit: 10
    t.string   "LIC_EBOOK_FORMAT",               limit: 10
    t.bigint   "REQ_LIC_LICENSE_ID"
    t.string   "LIC_SHIPP_IS_FREE",              limit: 1
    t.decimal  "LIC_DISCOUNT_PERCENTAGE",                    precision: 10, scale: 2
    t.bigint   "LIC_LICENSE_CATEGORY_DOMAIN_ID"
    t.integer  "LIC_BOOKS",                      limit: 2
    t.integer  "LIC_BORROW_TIME",                limit: 2
    t.index ["LIT_LICENSE_TEMPLATE_ID"], name: "RefCDP_LICENSE_TEMPLATE147", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER191", using: :btree
  end

  create_table "CDP_LICENSE_GROUP", primary_key: "LIG_LICENSE_GROUP_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "LGT_LIC_GRP_TEMPLATE_ID"
    t.bigint   "PUB_PUBLISHER_ID",                                             null: false
    t.string   "LIG_LIC_GROUP_NAME",      limit: 50
    t.string   "LIG_FOR_SALE",            limit: 1,                            null: false
    t.date     "LIG_LINK_FROM_DATE"
    t.date     "LIG_LINK_TO_DATE"
    t.decimal  "LIG_DISCOUNT_PERCENTAGE",             precision: 10, scale: 2
    t.string   "LIG_APPLY_ON_PACKAGES",   limit: 10
    t.string   "DELETED_IND",             limit: 1,                            null: false
    t.string   "CREATED_BY",              limit: 50
    t.datetime "CREATED_DATE",                                                 null: false
    t.string   "LASTUPDATED_BY",          limit: 50,                           null: false
    t.datetime "LASTUPDATED_DATE",                                             null: false
    t.string   "LIG_GROUP_CODE",          limit: 100
    t.index ["LGT_LIC_GRP_TEMPLATE_ID"], name: "RefCDP_LICENSE_GROUP_TEMPLATE164", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER240", using: :btree
  end

  create_table "CDP_LICENSE_GROUP_TEMPLATE", primary_key: "LGT_LIC_GRP_TEMPLATE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "LGT_GROUP_NAME",              limit: 100,                                                               null: false
    t.string   "LGT_FOR_SALE",                limit: 1,                            default: "Y",                        null: false
    t.decimal  "LGT_DISCOUNT_PERCENT",                    precision: 10, scale: 2
    t.string   "LGT_APPLY_ON_PACKAGES",       limit: 10,                           default: "NEW",                      null: false
    t.date     "LGT_LINK_FROM_DATE"
    t.date     "LGT_LINK_TO_DATE"
    t.string   "DELETED_IND",                 limit: 1,                                                                 null: false
    t.string   "CREATED_BY",                  limit: 50,                                                                null: false
    t.datetime "CREATED_DATE",                                                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",              limit: 50,                                                                null: false
    t.datetime "LASTUPDATED_DATE",                                                                                      null: false
    t.string   "LGT_GROUP_TEMPLATE_CODE",     limit: 100,                                                               null: false
    t.string   "LGT_APPLY_MEMBER_PUBLISHERS", limit: 1
    t.decimal  "LGT_ONLINE_PRICE_PERCENTAGE",             precision: 10, scale: 2
    t.decimal  "LGT_EBOOK_PRICE_PERCENTAGE",              precision: 10, scale: 2
    t.decimal  "LGT_COMBO_PRICE_PERCENTAGE",              precision: 10, scale: 2
  end

  create_table "CDP_LICENSE_PRICE", primary_key: "LIP_LICENSE_PRICE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "LIC_LICENSE_ID"
    t.bigint  "LIG_LICENSE_GROUP_ID"
    t.bigint  "CUR_CURRENCY_ID",                                     null: false
    t.bigint  "PUY_PUBLISHER_COUNTRY_ID"
    t.decimal "LIP_LIC_PRICE_AMOUNT",       precision: 10, scale: 2, null: false
    t.decimal "LIP_DISCOUNT_PERCENTAGE",    precision: 10, scale: 2
    t.integer "LIP_CONCURRENT_USAGE_LIMIT"
    t.index ["CUR_CURRENCY_ID"], name: "RefCDP_CURRENCY127", using: :btree
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE126", using: :btree
    t.index ["LIG_LICENSE_GROUP_ID"], name: "RefCDP_LICENSE_GROUP119", using: :btree
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY209", using: :btree
  end

  create_table "CDP_LICENSE_PRICE_REQUEST", primary_key: "REQ_LIP_LICENSE_PRICE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "REQ_LIC_LICENSE_ID"
    t.bigint  "CUR_CURRENCY_ID",                                         null: false
    t.bigint  "PUY_PUBLISHER_COUNTRY_ID"
    t.decimal "REQ_LIP_LIC_PRICE_AMOUNT",       precision: 10, scale: 2, null: false
    t.decimal "REQ_LIP_DISCOUNT_PERCENTAGE",    precision: 10, scale: 2
    t.integer "REQ_LIP_CONCURRENT_USAGE_LIMIT"
    t.index ["CUR_CURRENCY_ID"], name: "RefCDP_CURRENCY127", using: :btree
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY209", using: :btree
    t.index ["REQ_LIC_LICENSE_ID"], name: "RefCDP_LICENSE126", using: :btree
  end

  create_table "CDP_LICENSE_REQUEST", primary_key: "REQ_LIC_LICENSE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                                     null: false
    t.bigint   "REQ_LIC_LICENSE_TYPE_DOMAIN_ID",                                                       null: false
    t.string   "REQ_NO",                         limit: 100,                                           null: false
    t.string   "DELETED_IND",                    limit: 1,                                             null: false
    t.string   "CREATED_BY",                     limit: 50,                                            null: false
    t.datetime "CREATED_DATE",                                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",                 limit: 50,                                            null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "SHORT_DESC",                     limit: 256
    t.bigint   "USE_USER_ID",                                                                          null: false
    t.string   "REQ_LIC_LICENSE_NAME",           limit: 100,                                           null: false
    t.datetime "REQ_LIC_START_DATE"
    t.datetime "REQ_LIC_END_DATE"
    t.integer  "REQ_LIC_DURATION"
    t.string   "REQ_LIC_DURATION_UNITS",         limit: 10
    t.string   "REQ_LIC_EBOOK_FORMAT",           limit: 10
    t.string   "REQ_LICENSE_STATUS",             limit: 8
    t.text     "REQ_NOTES",                      limit: 16777215
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER191", using: :btree
  end

  create_table "CDP_LICENSE_TEMPLATE", primary_key: "LIT_LICENSE_TEMPLATE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID"
    t.string   "LIT_LICENSE_NAME",            limit: 100,                                                               null: false
    t.bigint   "LIT_LICENSE_TYPE_DOMAIN_ID",                                                                            null: false
    t.string   "LIT_FOR_SALE",                limit: 1,                                                                 null: false
    t.string   "LIT_IS_FREE",                 limit: 1,                                                                 null: false
    t.string   "LIT_SHIPP_IS_FREE",           limit: 1
    t.decimal  "LIT_ONLINE_PRICE_PERCENTAGE",             precision: 10, scale: 2
    t.decimal  "LIT_EBOOK_PRICE_PERCENTAGE",              precision: 10, scale: 2
    t.decimal  "LIT_PRINT_PRICE_PERCENTAGE",              precision: 10, scale: 2
    t.string   "LIT_CREATE_LIC_ON_PACKAGES",  limit: 10,                                                                null: false
    t.date     "LIT_LINK_FROM_DATE"
    t.date     "LIT_LINK_TO_DATE"
    t.datetime "LIT_LIC_START_DATE"
    t.datetime "LIT_LIC_END_DATE"
    t.integer  "LIT_LIC_DURATION"
    t.string   "LIT_LIC_DURATION_UNIT",       limit: 10
    t.string   "LIT_EBOOK_LIC_FORMAT",        limit: 10
    t.integer  "LIT_MAX_DOWNLOAD_ALLOWED",    limit: 2
    t.string   "LIT_DOWNLOAD_RESTRICTIONS",   limit: 50
    t.string   "DELETED_IND",                 limit: 1,                                                                 null: false
    t.string   "CREATED_BY",                  limit: 50,                                                                null: false
    t.datetime "CREATED_DATE",                                                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",              limit: 50,                                                                null: false
    t.datetime "LASTUPDATED_DATE",                                                                                      null: false
    t.string   "LIT_TEMPLATE_CODE",           limit: 100,                                                               null: false
    t.string   "LIT_APPLY_MEMBER_PUBLISHERS", limit: 1
    t.string   "LIT_CONTENT_TYPE",            limit: 50
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER146", using: :btree
  end

  create_table "CDP_LICENSE_TEMPLATE_STATUS", primary_key: "LTS_LIC_TEMPLATE_STATUS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "LIT_LICENSE_TEMPLATE_ID"
    t.bigint   "COM_CONTENT_ID"
    t.bigint   "LIC_LICENSE_ID"
    t.string   "LTS_STATUS",              limit: 20,                                       null: false
    t.datetime "CREATED_DATE",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint   "LGT_LIC_GRP_TEMPLATE_ID"
    t.string   "SHORT_DESC",              limit: 256
    t.datetime "LASTUPDATED_DATE"
    t.index ["COM_CONTENT_ID"], name: "RefCDP_CONTENT284", using: :btree
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE286", using: :btree
    t.index ["LIT_LICENSE_TEMPLATE_ID", "COM_CONTENT_ID", "LIC_LICENSE_ID", "LTS_STATUS"], name: "TEMP_STATUS.LIC_TEMP.CONT.PAC.LIC.STATUS.U", unique: true, using: :btree
  end

  create_table "CDP_LICENSE_TOKENS", primary_key: "LIS_LIC_TOKENS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "CMP_CAMPAIGN_ID"
    t.bigint   "LIC_LICENSE_ID"
    t.bigint   "LIG_LICENSE_GROUP_ID"
    t.string   "LIS_ACCESS_CODE",      limit: 600,                                      null: false
    t.bigint   "USE_USER_ID"
    t.datetime "LIS_VALID_FROM"
    t.datetime "LIS_VALID_TO"
    t.string   "LIS_TOKEN_STATUS",     limit: 20,  default: "ACTIVE",                   null: false
    t.string   "LIS_TOKEN_TYPE",       limit: 20,  default: "FREE_ACCESS",              null: false
    t.string   "CREATED_BY",           limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",       limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE"
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE133", using: :btree
    t.index ["LIG_LICENSE_GROUP_ID"], name: "RefCDP_LICENSE_GROUP119", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_LICENSE_TOKENS119", using: :btree
  end

  create_table "CDP_LIC_GROUP_LIC", primary_key: "LGL_LIC_GROUP_LIC_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "LIC_LICENSE_ID",       null: false
    t.bigint "LIG_LICENSE_GROUP_ID", null: false
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE140", using: :btree
    t.index ["LIG_LICENSE_GROUP_ID"], name: "RefCDP_LICENSE_GROUP141", using: :btree
  end

  create_table "CDP_LIC_TEMP_LIC_GRP_TEMP", primary_key: "LTL_LIC_TEMP_LIC_GRP_TEMP_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "LGT_LIC_GRP_TEMPLATE_ID", null: false
    t.bigint "LIT_LICENSE_TEMPLATE_ID", null: false
    t.index ["LGT_LIC_GRP_TEMPLATE_ID"], name: "RefCDP_LICENSE_GROUP_TEMPLATE165", using: :btree
    t.index ["LIT_LICENSE_TEMPLATE_ID"], name: "RefCDP_LICENSE_TEMPLATE166", using: :btree
  end

  create_table "CDP_LSI_CODE", primary_key: "LSI_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "LSI_TYPE",        limit: 20
    t.string "LSI_CODE",        limit: 20
    t.string "LSI_DESCRIPTION", limit: 200
    t.string "MPS_CODE",        limit: 20
    t.string "MPS_DESCRIPTION", limit: 200
  end

  create_table "CDP_PARTNERS_QUERY_FIELDS", primary_key: "PQF_QUERY_FIELD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "TPP_PARTNERS_ID",            null: false
    t.string "PQF_FIELD",       limit: 30
    t.string "PQF_FIELD_NAME",  limit: 30
    t.index ["TPP_PARTNERS_ID"], name: "RefCDP_THIRD_PARTY_PARTNERS226", using: :btree
  end

  create_table "CDP_PARTNER_KEYWORDS", primary_key: "PAK_KEYWORD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "TPP_PARTNERS_ID",               null: false
    t.string "PAK_KEYWORD",        limit: 30, null: false
    t.string "PAK_PARAMETER_NAME", limit: 30, null: false
    t.string "PAK_ALTERNATE_NAME", limit: 30
    t.string "PAK_PATTERN",        limit: 30
    t.index ["TPP_PARTNERS_ID"], name: "RefCDP_THIRD_PARTY_PARTNERS243", using: :btree
  end

  create_table "CDP_PARTNER_USER", primary_key: "COP_PARTNER_USER_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "USE_USER_ID",               null: false
    t.integer "COC_CONVERSION_PARTNER_ID", null: false
  end

  create_table "CDP_PH_CONTENT_DOWNLOAD", primary_key: "PCD_CONTENT_DOWNLOAD_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COM_CONTENT_ID",                                                      null: false
    t.bigint   "PUB_PUBLISHER_ID",                                                    null: false
    t.bigint   "PTO_PRINT_ORDER_ID",                                                  null: false
    t.datetime "PCD_CREATED_DATE",               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.bigint   "PTO_PRINT_HOUSE_ID",                                                  null: false
    t.string   "PCD_SECURITY_CODE",  limit: 200,                                      null: false
  end

  create_table "CDP_PH_SELECTION_RULE", primary_key: "CDP_RULE_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CDP_RULE_NAME",             limit: 200
    t.string "CDP_WEIGHT",                limit: 200
    t.string "CDP_OVERRIDING_PREFERENCE", limit: 200
    t.string "CDP_RULE_CONTEXT_NAME",     limit: 200
    t.string "CDP_RULE_ACTIVE",           limit: 5
  end

  create_table "CDP_PRINTHOUSE", primary_key: "PRI_PRINTHOUSE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "PRI_PRINTHOUSE_CODE",         limit: 50,                                         null: false
    t.bigint   "PUB_PUBLISHER_ID"
    t.text     "PRI_PRINTHOUSE_NAME",         limit: 65535,                                      null: false
    t.string   "PRI_CONTACT_FIRST_NAME",      limit: 100,                                        null: false
    t.string   "PRI_CONTACT_LAST_NAME",       limit: 100
    t.text     "PRI_CONTACT_EMAIL",           limit: 65535
    t.string   "PRI_CONTACT_PHONE",           limit: 20
    t.text     "PRI_CONTACT_ADDRESS_LINE1",   limit: 65535
    t.text     "PRI_CONTACT_ADDRESS_LINE2",   limit: 65535
    t.string   "PRI_CITY",                    limit: 50
    t.string   "PRI_STATE",                   limit: 50
    t.string   "PRI_POSTAL_CODE",             limit: 20
    t.string   "COI_COUNTRY_ID",              limit: 10,                                         null: false
    t.string   "PRI_VAT_REGISTRATION_NUMBER", limit: 100
    t.integer  "PRI_RANK"
    t.datetime "CREATED_DATE",                              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "CREATED_BY",                  limit: 100,                                        null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "LASTUPDATED_BY",              limit: 100
    t.index ["COI_COUNTRY_ID"], name: "FK_CDP_PRINTHOUSE2", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "FK_CDP_PRINTHOUSE", using: :btree
  end

  create_table "CDP_PRINTHOUSE_SHIPPINGCOUNTRY", primary_key: "PSH_PRINTHOUSE_SHIPPINGCOUNTRY_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "PRI_PRINTHOUSE_ID",            null: false
    t.string "COI_COUNTRY_ID",    limit: 10, null: false
    t.index ["COI_COUNTRY_ID"], name: "FK_CDP_PRINTHOUSE_SHIPPINGCOUNTRY2", using: :btree
    t.index ["PRI_PRINTHOUSE_ID"], name: "FK_CDP_PRINTHOUSE_SHIPPINGCOUNTRY", using: :btree
  end

  create_table "CDP_PRINTHOUSE_SHIPPINGTYPE", primary_key: "PST_PRINTHOUSE_SHIPPINGTYPE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "PRI_PRINTHOUSE_ID",        null: false
    t.bigint "CDP_PUB_SHIPPING_TYPE_ID", null: false
    t.index ["CDP_PUB_SHIPPING_TYPE_ID"], name: "FK_CDP_PRINTHOUSE_SHIPPINGTYPE2", using: :btree
    t.index ["PRI_PRINTHOUSE_ID"], name: "FK_CDP_PRINTHOUSE_SHIPPINGTYPE", using: :btree
  end

  create_table "CDP_PRINT_ORDER", primary_key: "PTO_PRINT_ORDER_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "ECT_TRANSACTION_ID",                                                                                   null: false
    t.bigint   "PUB_PUBLISHER_ID",                                                                                     null: false
    t.string   "PTO_POD_STATUS",           limit: 300,                                                                 null: false
    t.string   "PTO_TRANSACTON_LOCALE",    limit: 300
    t.bigint   "PTO_SHIP_COUNTRY_ID",                                                                                  null: false
    t.text     "PTO_COMMENTS",             limit: 65535
    t.bigint   "CDP_PUB_SHIPPING_TYPE_ID",                                                                             null: false
    t.bigint   "PRI_PRINTHOUSE_ID"
    t.decimal  "PTO_SHIPPING_CHARGES",                   precision: 10, scale: 2
    t.datetime "CREATED_DATE",                                                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "PTO_PRINT_ORDER_NO",       limit: 100
    t.bigint   "CUR_CURRENCY_ID"
    t.index ["ECT_TRANSACTION_ID"], name: "ECT_TRANSACTION_ID", unique: true, using: :btree
  end

  create_table "CDP_PRINT_ORDER_ACTION", primary_key: "POA_ACTION_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "POA_ACTION_GROUP",                                                       null: false
    t.string   "POA_ACTION_NAME",       limit: 200,                                      null: false
    t.string   "POA_SECURITY_CODE",     limit: 500,                                      null: false
    t.string   "POA_AUTOMATED",         limit: 2,                                        null: false
    t.bigint   "PTO_PRINT_ORDER_ID",                                                     null: false
    t.string   "POA_STATUS",            limit: 200
    t.datetime "POA_CREATED_DATE",                  default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "POA_LAST_UPDATED_DATE",                                                  null: false
    t.string   "POA_TRANSFORMED_STATE", limit: 500
  end

  create_table "CDP_PRINT_ORDER_CONTENT", primary_key: "CDP_PRINT_ORDER_CONTENT_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "COM_CONTENT_ID",                                       null: false
    t.bigint  "PTO_PRINT_ORDER_ID"
    t.integer "POC_PRINT_ORDER_QUANTITY",                 default: 1, null: false
    t.string  "POC_PH_DOWNLOAD_SECURITYCODE", limit: 500
    t.string  "POC_PH_CONTENT_FORMAT",        limit: 500
  end

  create_table "CDP_PRINT_ORDER_HISTORY", primary_key: "PTH_HISTORY_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PTO_PRINT_ORDER_ID",                                                     null: false
    t.text     "PTO_COMMENTS",        limit: 65535
    t.string   "PTO_POD_PREV_STATUS", limit: 200
    t.string   "PTO_ACTION",          limit: 200
    t.bigint   "PTO_PRINT_HOUSE_ID"
    t.datetime "PTH_DATE",                          default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "CDP_PROMO_CODE", primary_key: "CPC_PROMOCODE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "CMP_CAMPAIGN_ID",                                                          null: false
    t.string   "CDP_PROMOCODE_IDENTIFIER", limit: 50
    t.bigint   "CPC_DISCOUNT_PERCENT",                                                     null: false
    t.datetime "CPC_VALID_FROM"
    t.datetime "CPC_VALID_TO"
    t.string   "CPC_STATUS",               limit: 10, default: "ACTIVE"
    t.string   "CREATED_BY",               limit: 50
    t.datetime "CREATED_DATE",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["CMP_CAMPAIGN_ID"], name: "FK_PROMO_CAMPAIGN_ID", using: :btree
  end

  create_table "CDP_PUBLISHER", primary_key: "PUB_PUBLISHER_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC", comment: "number_of_replicas: 1" do |t|
    t.string   "PUB_CODE",                   limit: 50,                                       null: false
    t.string   "PUB_STATUS",                 limit: 7,                                        null: false
    t.string   "PUB_NAME",                   limit: 100,                                      null: false
    t.string   "PUB_CDP_SITE_NAME"
    t.string   "PUB_END_USR_LANGUAGE",       limit: 50
    t.string   "PUB_ADMIN_TOOL_LANGUAGE_ID", limit: 50
    t.string   "PUB_LOGO_PATH"
    t.string   "PUB_INTERNAL_URL",           limit: 512
    t.string   "PUB_CDP_HOME_URL",           limit: 512
    t.string   "PUB_EXTERNAL_URL",           limit: 512
    t.string   "PUB_HOME_PAGE_TYPE",         limit: 10,  default: "ADVANCE"
    t.string   "CREATED_BY",                 limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",             limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "PUB_LANDING_PAGE",           limit: 32,  default: "BI"
    t.string   "PUB_SHOW_IMPRINT",           limit: 1,   default: "N",                        null: false
    t.string   "PUB_SHOW_ADVERT",            limit: 1,   default: "N",                        null: false
    t.string   "PUB_INDEX_STATUS",           limit: 1,   default: "N"
    t.integer  "PUB_GUEST_USER_LIMIT",                   default: 0
    t.integer  "PUB_VIEWABILITY_PCT",                    default: 0
    t.string   "PUB_SERVICETYPE",            limit: 20
    t.index ["PUB_ADMIN_TOOL_LANGUAGE_ID"], name: "RefCDP_LANGUAGE178", using: :btree
    t.index ["PUB_CODE"], name: "PUBLISHER.PUB_CODE.U", unique: true, using: :btree
    t.index ["PUB_END_USR_LANGUAGE"], name: "RefCDP_LANGUAGE177", using: :btree
  end

  create_table "CDP_PUBLISHER_CONTACTS", primary_key: "PUC_PUB_CONTACTS_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                   null: false
    t.string   "PUC_CONTACT_FNAME", limit: 100,                                      null: false
    t.string   "PUC_CONTACT_LNAME", limit: 100,                                      null: false
    t.bigint   "PUC_CONTACT_TYPE",                                                   null: false
    t.string   "PUC_CONTACT_EMAIL",                                                  null: false
    t.string   "AUDIT_CRE_USER",    limit: 30
    t.datetime "AUDIT_CRE_DATE",                default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "AUDIT_UPD_DATE"
    t.string   "AUDIT_UPD_USER",    limit: 30
    t.index ["PUB_PUBLISHER_ID", "PUC_CONTACT_TYPE"], name: "PUB_CONTACTS.PUBLISHER_ID.TYPE.DELETED_IND.UK", unique: true, using: :btree
  end

  create_table "CDP_PUBLISHER_COUNTRY", primary_key: "PUY_PUBLISHER_COUNTRY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PUBLISHER_ID",              null: false
    t.string "PUY_COUNTRY_CODE",    limit: 5, null: false
    t.bigint "PUY_SEQUENCE_NUMBER"
    t.string "DELETED_IND",         limit: 1, null: false
    t.index ["PUB_PUBLISHER_ID"], name: "PUB_PUBLISHER_ID", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "PUB_PUBLISHER_ID_2", using: :btree
  end

  create_table "CDP_PUBLISHER_COUNTRY_CURRENCY", primary_key: "PCC_PUBLISHER_COUNTRY_CURRENCY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "PUB_PUBLISHER_ID",                                             null: false
    t.bigint  "PUY_PUBLISHER_COUNTRY_ID",                                     null: false
    t.bigint  "CUR_CURRENCY_ID",                                              null: false
    t.string  "PCC_TAX_TYPE",             limit: 25
    t.decimal "PCC_TAX_PERCENTAGE",                  precision: 10, scale: 2
    t.index ["CUR_CURRENCY_ID"], name: "RefCDP_CURRENCY145", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER145", using: :btree
    t.index ["PUY_PUBLISHER_COUNTRY_ID"], name: "RefCDP_COUNTRY145", using: :btree
  end

  create_table "CDP_PUBLISHER_COUNTRY_NAME", primary_key: "PUC_PUBLISHER_COUNTRY_NAME_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUC_PUBLISHER_COUNTRY_ID",                            null: false
    t.bigint "PUC_LANGUAGE_ID",                                     null: false
    t.string "PUC_PUBLISHER_COUNTRY_NAME", limit: 100, default: "", null: false
    t.index ["PUC_PUBLISHER_COUNTRY_ID", "PUC_LANGUAGE_ID"], name: "XUK_CDP_COM_PUBLISHER_COUNTRY", unique: true, using: :btree
  end

  create_table "CDP_PUBLISHER_IMPRINTS", primary_key: "PIM_PUB_IMPRINT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PUBLISHER_ID",                                null: false
    t.string "PIM_IMPRINT_CODE",      limit: 50,                null: false
    t.string "PIM_IMPRINT_NAME",      limit: 100,               null: false
    t.string "PIM_IMPRINT_LOGO_PATH"
    t.string "PIM_LOGO_DISPLAY_IND",  limit: 1,   default: "Y", null: false
    t.index ["PIM_IMPRINT_CODE"], name: "PIM_IMPRINT_CODE", using: :btree
    t.index ["PIM_IMPRINT_CODE"], name: "PIM_IMPRINT_CODE_2", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER227", using: :btree
  end

  create_table "CDP_PUBLISHER_STATIC_DATA", primary_key: "PSD_PUBLISHER_STATIC_DATA_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "PUB_PUBLISHER_ID",                                       null: false
    t.string  "LAN_LANGUAGE_ID",          limit: 50,                    null: false
    t.string  "PSD_STATIC_DATA_CATEGORY", limit: 50,                    null: false
    t.string  "PSD_STATIC_DATA_KEY",      limit: 100,      default: "", null: false
    t.text    "PSD_STATIC_DATA_TEXT",     limit: 16777215,              null: false
    t.integer "PSD_STATIC_DATA_ORDER",    limit: 2
    t.string  "SHORT_DESC",               limit: 256
    t.index ["LAN_LANGUAGE_ID"], name: "RefCDP_LANGUAGE244", using: :btree
    t.index ["PUB_PUBLISHER_ID", "PSD_STATIC_DATA_CATEGORY", "PSD_STATIC_DATA_KEY", "LAN_LANGUAGE_ID"], name: "PUB_STATIC_DATA.PUB_ID.DATA_CATEGORY.DATA_KEY.UK", unique: true, using: :btree
  end

  create_table "CDP_PUBLISHER_UPLOADED_FILES", primary_key: "PUF_UPLOADED_FILES_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                        null: false
    t.string   "LAN_LANGUAGE_ID",        limit: 50,                                       null: false
    t.string   "PUF_SECTION",            limit: 100,                                      null: false
    t.string   "PUF_UPLOADED_FILE_NAME", limit: 150,                                      null: false
    t.string   "UPLOADED_BY",            limit: 50,                                       null: false
    t.datetime "UPLOADED_DATE",                      default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "CDP_PUBLISHER_USER", primary_key: "PUA_PUBLISHER_USER_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PUBLISHER_ID", null: false
    t.bigint "USE_USER_ID",      null: false
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER137", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_USER200", using: :btree
  end

  create_table "CDP_PUB_PARENT_CHILD", primary_key: "PPC_PUB_PARENT_CHILD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PARENT_ID",           null: false
    t.bigint "PUB_CHILD_ID",            null: false
    t.string "DELETED_IND",   limit: 1, null: false
    t.index ["PUB_CHILD_ID"], name: "RefCDP_PUBLISHER184", using: :btree
    t.index ["PUB_PARENT_ID", "PUB_CHILD_ID"], name: "PUB_PARENT_CHILD.PARENT.CHILD.UK", unique: true, using: :btree
  end

  create_table "CDP_REPORTS", primary_key: "REP_REPORT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
  end

  create_table "CDP_REPORTS_TEMP", primary_key: "COM_CONTENT_ID", id: :bigint, default: nil, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUBLISHER_ID",                                  null: false
    t.string   "PUB_CODE",                     limit: 50
    t.string   "PUB_NAME",                     limit: 100
    t.string   "COM_CONTENT_CODE",             limit: 100
    t.string   "COM_CONTENT_STATUS",           limit: 15
    t.datetime "VAR_LIVE_DATE"
    t.datetime "VAR_STAGING_DATE"
    t.datetime "VAR_RFC_DATE"
    t.string   "BOC_BOOK_ISBN13",              limit: 50
    t.text     "VAR_COM_DOI_CODE",             limit: 16777215
    t.string   "COM_TITLE",                    limit: 500
    t.string   "COM_SUB_TITLE",                limit: 500
    t.text     "VAR_BOC_CONTRIBUTORS",         limit: 16777215
    t.text     "VAR_BOC_BINDING_TYPE",         limit: 16777215
    t.string   "COM_TOTAL_CONTENT_UNITS",      limit: 500
    t.string   "BOC_BOOK_EDITION",             limit: 500
    t.string   "PUBLICATION_DATE",             limit: 20
    t.string   "LANGUAGE",                     limit: 20
    t.string   "BOC_SERIES_TITLE",             limit: 500
    t.string   "VAR_BOOKSTORE_URL",            limit: 500
    t.text     "VAR_SUG_GROUP_CODE",           limit: 16777215
    t.string   "VAR_SEARCH_ENGINE",            limit: 256
    t.string   "BOC_SERIES_ISBN",              limit: 50
    t.string   "BOC_FIRST_PAGE_OF_FULL_TEXT",  limit: 100
    t.string   "BOC_LAST_PAGE_OF_FULL_TEXT",   limit: 100
    t.string   "COM_GUEST_USER_ACCESS_LIMIT",  limit: 100
    t.string   "COM_AUTH_USER_ACCESS_LIMIT",   limit: 100
    t.string   "COM_VIEWING_LIMIT_PERCENTAGE", limit: 50
    t.string   "COM_RESTRICED_UNITS",          limit: 500
    t.string   "ARC_ARTICLE_SECTION",          limit: 70
    t.bigint   "DOM_DOMAIN_ID"
    t.datetime "CREATED_DATE"
    t.string   "PARENT_CODE",                  limit: 70
  end

  create_table "CDP_RESOURCE", primary_key: "RES_RESOURCE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "RES_RESOURCE_NAME", limit: 100, null: false
    t.string "RES_RESOURCE_DESC", limit: 500
    t.string "SHORT_DESC",        limit: 256
  end

  create_table "CDP_RESOURCE_GROUP", primary_key: "REG_RES_GROUP_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "REG_RES_GROUP_NAME", limit: 100, null: false
    t.string "REG_RES_GROUP_DESC", limit: 500
    t.string "SHORT_DESC",         limit: 256
  end

  create_table "CDP_RES_GROUP_RES", primary_key: "RGS_RES_GROUP_RESOURCE_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "REG_RES_GROUP_ID", null: false
    t.bigint "RES_RESOURCE_ID",  null: false
    t.index ["REG_RES_GROUP_ID"], name: "RefCDP_RESOURCE_GROUP233", using: :btree
    t.index ["RES_RESOURCE_ID"], name: "RefCDP_RESOURCE234", using: :btree
  end

  create_table "CDP_RES_GRP_SEC_ROLE", primary_key: "RGS_GROUP_SEC_ROLE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "REG_RES_GROUP_ID"
    t.bigint "SER_SECURITY_ROLE_ID",            null: false
    t.string "RGS_ACCESS_RIGHTS",    limit: 20, null: false
    t.index ["REG_RES_GROUP_ID"], name: "RefCDP_RESOURCE_GROUP232", using: :btree
    t.index ["SER_SECURITY_ROLE_ID"], name: "RefCDP_SECURITY_ROLE235", using: :btree
  end

  create_table "CDP_RETAILER", primary_key: "RETAILER_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string  "RETAILER_CODE",        limit: 50,              null: false
    t.string  "REATILER_NAME",        limit: 50,              null: false
    t.bigint  "PUB_PUBLISHER_ID",                             null: false
    t.string  "REFERRAL_URL",         limit: 50
    t.string  "RETAILER_IP_RANGE",    limit: 50
    t.integer "RETAILER_STATUS_CD",               default: 1
    t.string  "RETAILER_CONFIG_PATH", limit: 500
    t.string  "RETAILER_SALES_LINK"
  end

  create_table "CDP_RETAILER_IP_DETAILS", primary_key: "CRI_IP_AUTH_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "CRI_LOW_IP",        limit: 200
    t.string "CRI_HIGH_IP",       limit: 200
    t.string "CRI_IP_LIST",       limit: 1000
    t.string "CRI_RETAILER_CODE", limit: 100,  null: false
  end

  create_table "CDP_SECURITY_ROLE", primary_key: "SER_SECURITY_ROLE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "SER_SECURITY_ROLE_NAME",     limit: 100, null: false
    t.string "SER_SECURITY_ROLE_DESC",     limit: 500
    t.string "SER_SECURITY_ROLE_CATEGORY", limit: 15,  null: false
    t.string "SHORT_DESC",                 limit: 256
    t.index ["SER_SECURITY_ROLE_NAME"], name: "SER_SECURITY_ROLE_NAME", using: :btree
    t.index ["SER_SECURITY_ROLE_NAME"], name: "SER_SECURITY_ROLE_NAME_2", using: :btree
  end

  create_table "CDP_SHARED_COMMENTS", primary_key: "SHARED_COMMENT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",               default: 0, null: false
    t.bigint "USE_USER_ID",                  default: 0, null: false
    t.binary "FDF_TEXT",       limit: 65535
    t.string "PAGE_NO",        limit: 50
    t.string "PAGE_SEQ_NO",    limit: 50
    t.bigint "ARTICLE_ID"
  end

  create_table "CDP_SHIPPING_ADDRESS_FIELD", primary_key: "CDP_ID", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "CDP_FIELD_NAME",     limit: 200
    t.string  "CDP_FIELD_VALUE",    limit: 200
    t.integer "PTO_PRINT_ORDER_ID",             null: false
    t.integer "USR_USER_FIELD_ID"
  end

  create_table "CDP_SHIPPING_PRICES", primary_key: "SHP_SHIPPING_PRICE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint  "PUB_PUBLISHER_ID",                     null: false
    t.bigint  "CDP_PUB_SHIPPING_TYPE_ID",             null: false
    t.float   "SHP_SHIPPING_PRICE",        limit: 53
    t.string  "SHP_CURRENCY_CODE",         limit: 10
    t.bigint  "COI_COUNTRY_ID",                       null: false
    t.integer "SHP_AVERAGE_SHIPPING_DAYS"
    t.index ["CDP_PUB_SHIPPING_TYPE_ID"], name: "FK_CDP_SHIPPING_PRICES_2", using: :btree
    t.index ["COI_COUNTRY_ID"], name: "FK_CDP_SHIPPING_PRICES_3", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "FK_CDP_SHIPPING_PRICES", using: :btree
  end

  create_table "CDP_SHIPPING_PRICE_WEIGHT", primary_key: "SHP_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.float   "SHP_SHIPPING_PRICE",    limit: 53
    t.integer "SHP_MIN_WEIGHT"
    t.integer "SHP_MAX_WIGHT"
    t.string  "SHP_WEIGHT_TYPE",       limit: 20
    t.integer "SHP_SHIPPING_PRICE_ID",            null: false
  end

  create_table "CDP_SHIPPING_TYPE", primary_key: "CDP_PUB_SHIPPING_TYPE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PUBLISHER_ID",              null: false
    t.string "CDP_SHIPPING_NAME", limit: 200
    t.string "CDP_SHIPPING_CODE", limit: 200, null: false
  end

  create_table "CDP_SITE_CONTACT_US_CATEGORIES", primary_key: "SCU_CONTACT_US_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "PUB_PUBLISHER_ID",                                 null: false
    t.string "LAN_LANGUAGE_ID",         limit: 50,               null: false
    t.string "SCU_CATEGORY_TITLE",      limit: 80,  default: "", null: false
    t.string "SCU_RESP_EMAIL",                                   null: false
    t.string "SCU_CATEGORY_DISCIPLINE", limit: 32,               null: false
    t.string "SCU_DISCRIPTION",         limit: 250,              null: false
    t.index ["LAN_LANGUAGE_ID"], name: "RefCDP_LANGUAGE249", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER204", using: :btree
  end

  create_table "CDP_SITE_FEEDBACK", primary_key: "SFE_SITE_FEEDBACK_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                        null: false
    t.string   "SFE_USER_NAME",     limit: 100,                                           null: false
    t.string   "SFE_USER_EMAIL",                                                          null: false
    t.bigint   "SCU_CONTACT_US_ID",                                                       null: false
    t.text     "SFE_FEEDBACK_TEXT", limit: 16777215,                                      null: false
    t.string   "SFE_IS_EMAIL_SENT", limit: 1,                                             null: false
    t.string   "CREATED_BY",        limit: 50,                                            null: false
    t.datetime "CREATED_DATE",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",    limit: 50,                                            null: false
    t.datetime "LASTUPDATED_DATE",                                                        null: false
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER202", using: :btree
    t.index ["SCU_CONTACT_US_ID"], name: "RefCDP_SITE_CONTACT_US_CATEGORIES208", using: :btree
  end

  create_table "CDP_SUBJECT_GROUP", primary_key: "SUG_GROUP_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "SUG_PARENT_ID"
    t.bigint   "PUB_PUBLISHER_ID",                                                                null: false
    t.string   "SUG_GROUP_NAME",               limit: 100,                                        null: false
    t.string   "SUG_GROUP_CODE",               limit: 50,                                         null: false
    t.string   "SUG_GROUP_DESC",               limit: 500
    t.float    "SUG_DISCOUNT_PERCENTAGE",      limit: 53,    default: 0.0
    t.integer  "SUG_GUEST_USER_ACCESS_LIMIT"
    t.integer  "SUG_AUTH_USER_ACCESS_LIMIT"
    t.integer  "SUG_VIEWING_LIMIT_PERCENTAGE", limit: 2
    t.string   "DELETED_IND",                  limit: 1,     default: "N",                        null: false
    t.string   "CREATED_BY",                   limit: 50,                                         null: false
    t.datetime "CREATED_DATE",                               default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",               limit: 50,                                         null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "SHORT_DESC",                   limit: 256
    t.text     "SUG_HIERARCHY",                limit: 65535
    t.string   "LAN_LANGUAGE_ID",              limit: 50,                                         null: false
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER144", using: :btree
    t.index ["SUG_PARENT_ID"], name: "RefCDP_SUBJECT_GROUP203", using: :btree
  end

  create_table "CDP_THIRD_PARTY_PARTNERS", primary_key: "TPP_PARTNERS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "TPP_PARTNER_CODE",          limit: 10
    t.string "TPP_PARTNER_NAME",          limit: 100, null: false
    t.string "TPP_URL_BEFORE_IDENTIFIER", limit: 512, null: false
    t.string "TPP_PARTNER_TYPE",          limit: 10
    t.string "TPP_URL_AFTER_IDENTIFIER",  limit: 100
    t.string "SHORT_DESC",                limit: 256
    t.string "TPP_IDENTIFIER",            limit: 20
    t.string "TPP_CONTACT_NAME",          limit: 100
    t.string "TPP_CONTACT_EMAIL",         limit: 100
    t.string "TPP_CONTACT_PHONE",         limit: 50
  end

  create_table "CDP_TRANSACTION_DETAILS", primary_key: "TRD_TRANSACTION_DETAILS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "ECT_TRANSACTION_ID",                                                            null: false
    t.bigint   "COM_CONTENT_ID"
    t.string   "TRD_CONTENT_TITLE",          limit: 1000
    t.string   "TRD_PRIMARY_ISBN",           limit: 100
    t.string   "TRD_CONTENT_FORMAT",         limit: 50
    t.string   "TRD_FORMAT_ISBN",            limit: 100
    t.bigint   "PUB_PUBLISHER_ID",                                                              null: false
    t.datetime "CREATED_DATE",                             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.float    "TRD_CONTENT_PRICE",          limit: 53
    t.float    "TRD_TAX_AMOUNT",             limit: 53
    t.float    "TRD_DISCOUNT",               limit: 53
    t.bigint   "TRD_LICENSE_GROUP_ID"
    t.string   "TRD_DOWNLOAD_URL",           limit: 500
    t.bigint   "LIC_LICENSE_ID"
    t.string   "LIC_LICENSE_TYPE",           limit: 50
    t.string   "IS_GIFT",                    limit: 1
    t.string   "TRD_GIFT_MAILID",            limit: 50
    t.text     "TRD_GIFT_MESSAGE",           limit: 65535
    t.bigint   "CPC_DISCOUNT_PERCENT"
    t.bigint   "TRD_LICENSE_LEVEL_DISCOUNT"
    t.string   "ECT_ACS_ORDERID",            limit: 20
    t.index ["ECT_TRANSACTION_ID"], name: "RefCDP_ECOMMERCE_TRANSACTION119", using: :btree
    t.index ["PUB_PUBLISHER_ID"], name: "RefCDP_PUBLISHER119", using: :btree
  end

  create_table "CDP_UNSUCCESSFUL_TRANSACTION", primary_key: "UNT_FAILED_TRANS_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USE_USER_ID",        null: false
    t.bigint "ECT_TRANSACTION_ID", null: false
    t.index ["ECT_TRANSACTION_ID"], name: "RefCDP_ECOMMERCE_TRANSACTION119", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_USER119", using: :btree
  end

  create_table "CDP_URL_GENERATOR", primary_key: "GEN_GENERATOR_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "GEN_RETAILER_ID",      limit: 100
    t.string   "GEN_TRANSACTION_ID",   limit: 100
    t.string   "GEN_ISBN",             limit: 100
    t.string   "GEN_FORMAT",           limit: 20
    t.datetime "GEN_CREATED_DATE"
    t.string   "GEN_SCODE",            limit: 100
    t.datetime "GEN_EXPIRY_DATE"
    t.datetime "GEN_DOWNLOAD_DATE"
    t.string   "GEN_CODE",             limit: 20
    t.string   "GEN_MESSAGE",          limit: 200
    t.string   "GEN_STATUS_CODE",      limit: 20
    t.string   "GEN_DOWNLOAD_CODE",    limit: 20
    t.string   "GEN_DOWNLOAD_MESSAGE", limit: 200
    t.string   "GEN_TYPE",             limit: 20
    t.string   "GEN_FORMAT_ISBN",      limit: 30
  end

  create_table "CDP_USER", primary_key: "USE_USER_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "INS_INSTITUTION_ID"
    t.string   "USE_USER_TYPE",            limit: 20,                                      null: false
    t.string   "USE_STATUS",               limit: 8,                                       null: false
    t.string   "LAN_LANGUAGE_ID",          limit: 50
    t.string   "CREATED_BY",               limit: 50,                                      null: false
    t.datetime "CREATED_DATE",                        default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",           limit: 50,                                      null: false
    t.datetime "LASTUPDATED_DATE",                                                         null: false
    t.string   "USE_USER_NAME",            limit: 50,                                      null: false
    t.string   "USE_USER_PASS",            limit: 50,                                      null: false
    t.string   "USE_FIRST_NAME",           limit: 50,                                      null: false
    t.string   "USE_LAST_NAME",            limit: 50,                                      null: false
    t.bigint   "PUY_PUBLISHER_COUNTRY_ID",                                                 null: false
    t.string   "USE_EMAIL",                limit: 50
    t.index ["LAN_LANGUAGE_ID"], name: "RefCDP_LANGUAGE125", using: :btree
    t.index ["USE_USER_NAME"], name: "USE_USER_NAME", using: :btree
  end

  create_table "CDP_USER_CART", primary_key: "USC_USER_CART", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USE_USER_ID",               null: false
    t.string "USC_CART_TYPE", limit: 10,  null: false
    t.string "USC_CART_NAME", limit: 100, null: false
    t.string "SHORT_DESC",    limit: 256
    t.index ["USE_USER_ID"], name: "RefCDP_USER167", using: :btree
  end

  create_table "CDP_USER_COMMENTS", primary_key: "USER_COMMENT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",               default: 0, null: false
    t.bigint "USE_USER_ID",                  default: 0, null: false
    t.binary "FDF_TEXT",       limit: 65535
    t.string "PAGE_NO",        limit: 50
    t.string "PAGE_SEQ_NO",    limit: 50
    t.bigint "ARTICLE_ID"
  end

  create_table "CDP_USER_DEMOGRAPHIC_DATA", primary_key: "URD_USER_DATA_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USE_USER_ID",                          null: false
    t.bigint "USR_USER_FIELD_ID",                    null: false
    t.text   "URD_REG_FIELD_VALUE", limit: 16777215
    t.index ["USE_USER_ID"], name: "RefCDP_USER148", using: :btree
    t.index ["USR_USER_FIELD_ID"], name: "RefCDP_USER_DEMOGRAPHIC_FIELDS149", using: :btree
  end

  create_table "CDP_USER_DEMOGRAPHIC_FIELDS", primary_key: "USR_USER_FIELD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "PUB_PUBLISHER_ID",                                                              null: false
    t.string   "USR_FIELD_NAME",               limit: 100,                                      null: false
    t.string   "USR_DISPLAY_OPTIONS",          limit: 20,                                       null: false
    t.string   "USR_STATUS",                   limit: 8,                                        null: false
    t.string   "USR_FIELD_MANDATORY_FOR_REG",  limit: 1,                                        null: false
    t.string   "USR_FIELD_MANDATORY_FOR_ECOM", limit: 1,                                        null: false
    t.string   "USR_FIELD_TYPE",               limit: 25,                                       null: false
    t.string   "USR_FIELD_IS_EDITABLE",        limit: 1,                                        null: false
    t.string   "USR_FIELD_VALIDATION",         limit: 100
    t.integer  "USR_FIELD_ORDER",                                                               null: false
    t.integer  "USR_FIELD_MIN_CHAR",                                                            null: false
    t.integer  "USR_FIELD_MAX_CHAR",                                                            null: false
    t.string   "CREATED_BY",                   limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",               limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE",                                                              null: false
    t.string   "SHORT_DESC",                   limit: 256
    t.index ["PUB_PUBLISHER_ID", "USR_FIELD_NAME", "USR_DISPLAY_OPTIONS"], name: "DEMOGRAPHIC_FIELDS.FIELD_NAME.FIELD_LABEL.UK", unique: true, using: :btree
  end

  create_table "CDP_USER_DEMOGRAPHIC_LABEL", primary_key: "UDF_DEMOGRAPHIC_LABEL_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "LAN_LANGUAGE_ID",                      null: false
    t.bigint "USR_USER_FIELD_ID",                    null: false
    t.string "UDF_FIELD_LABEL",          limit: 200
    t.string "UDF_FIELD_DEFAULT_VALUES", limit: 500
  end

  create_table "CDP_USER_LICENSE", primary_key: "USL_USER_LIC_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "USE_USER_ID",                                                                  null: false
    t.bigint   "LIC_LICENSE_ID",                                                               null: false
    t.bigint   "ECT_TRANSACTION_ID",                                                           null: false
    t.datetime "USL_START_DATE"
    t.datetime "USL_END_DATE"
    t.integer  "USL_UNITS_USED"
    t.string   "USL_LICENSE_STATUS",   limit: 10,                           default: "ACTIVE", null: false
    t.decimal  "USL_ACTUAL_AMOUNT",                precision: 10, scale: 2
    t.bigint   "LIG_LICENSE_GROUP_ID"
    t.bigint   "CUR_CURRENCY_ID"
    t.string   "CREATED_BY",           limit: 50,                                              null: false
    t.datetime "CREATED_DATE"
    t.string   "LASTUPDATED_BY",       limit: 50,                                              null: false
    t.datetime "LASTUPDATED_DATE"
    t.string   "SHORT_DESC",           limit: 256
    t.string   "DELETED_IND",          limit: 1,                                               null: false
    t.string   "DOWNLOAD_URL",         limit: 500
    t.string   "RESPONSE_CODE",        limit: 5
    t.string   "USE_ACS_ORDERID",      limit: 20
    t.string   "UTY_TRANSACTION_TYPE", limit: 20
    t.string   "UTY_IS_ACS_EXPIRED",   limit: 1,                            default: ""
    t.bigint   "CON_CONTENT_ID"
    t.index ["ECT_TRANSACTION_ID"], name: "RefCDP_ECOMMERCE_TRANSACTION150", using: :btree
    t.index ["LIC_LICENSE_ID"], name: "RefCDP_LICENSE109", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_USER110", using: :btree
  end

  create_table "CDP_USER_LICENSE_BORROW", primary_key: "USR_LIC_BOR_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.bigint   "USE_USER_ID"
    t.bigint   "LIC_LICENSE_ID"
    t.string   "USL_LICENSE_STATUS",   limit: 10
    t.datetime "BORROW_DATE"
    t.datetime "DOWNLOAD_DATE"
    t.datetime "EXPIRY_DATE"
    t.string   "DOWNLOADURL",          limit: 500
    t.string   "ACS_ORDER_ID",         limit: 20
    t.string   "USR_TRANSACTION_TYPE", limit: 20
    t.bigint   "CON_CONTENT_ID"
    t.string   "USR_MATTER_CODE",      limit: 20
  end

  create_table "CDP_USER_LICENSE_DETAILS", primary_key: "CDP_USER_LIC_DETAILS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "USL_USER_LIC_ID",                  null: false
    t.string   "CDP_CONTENT_CODE",     limit: 100,              collation: "utf8_unicode_ci"
    t.string   "ARTICLE_DOWNLOAD_URL", limit: 500,              collation: "utf8_unicode_ci"
    t.datetime "CREATED_DATE"
  end

  create_table "CDP_USER_NOTES", primary_key: "CHAPTER_NOTES_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "COM_CONTENT_ID",               null: false
    t.string "COM_TITLE",        limit: 500
    t.bigint "USE_USER_ID",                  null: false
    t.string "COM_CONTENT_CODE", limit: 100
  end

  create_table "CDP_USER_NOTE_DETAILS", primary_key: "NOTE_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "CHAPTER_NOTES_ID",                                                         null: false
    t.string   "PAGE_NO",          limit: 20,                                              null: false
    t.text     "NOTE_TEXT",        limit: 4294967295,                                      null: false
    t.string   "NOTE_TITLE",       limit: 500
    t.datetime "LAST_UPDATED_ON",                     default: -> { "CURRENT_TIMESTAMP" }
    t.string   "PAGE_SEQ_NO",      limit: 20,         default: "0",                        null: false
  end

  create_table "CDP_USER_PARENT_CHILD", primary_key: "UPC_USER_PARENT_CHILD_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "UPC_CHILD_ID"
    t.bigint "UPC_PARENT_ID"
    t.string "UPC_INHERIT_LICENSES", limit: 1
    t.index ["UPC_CHILD_ID"], name: "RefCDP_USER25", using: :btree
    t.index ["UPC_PARENT_ID"], name: "RefCDP_USER24", using: :btree
  end

  create_table "CDP_USER_SEARCHES", primary_key: "USER_SEARCH_ID", id: :bigint, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint   "USE_USER_ID",                                                        null: false
    t.string   "SEARCH_TITLE", limit: 100,                                           null: false
    t.text     "SEARCH_URL",   limit: 16777215,                                      null: false
    t.datetime "SEARCH_DATE",                   default: -> { "CURRENT_TIMESTAMP" }
  end

  create_table "CDP_USER_SECURITY_ROLE", primary_key: "USY_USER_SECURITY_ROLE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USE_USER_ID",          null: false
    t.bigint "SER_SECURITY_ROLE_ID", null: false
    t.index ["SER_SECURITY_ROLE_ID"], name: "RefCDP_SECURITY_ROLE119", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_USER118", using: :btree
  end

  create_table "CDP_USER_SHARED_COMMENTS", primary_key: "USER_SHARED_COMMENT_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "SHARED_COMMENT_ID", default: 0, null: false
    t.bigint "USE_USER_ID",       default: 0, null: false
  end

  create_table "CDP_USER_SUBJECT", primary_key: "USS_USER_SUB_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC" do |t|
    t.bigint "USE_USER_ID",  null: false
    t.bigint "SUG_GROUP_ID", null: false
    t.index ["SUG_GROUP_ID"], name: "RefCDP_SUBJECT_GROUP299", using: :btree
    t.index ["USE_USER_ID"], name: "RefCDP_USER199", using: :btree
  end

  create_table "CDP_USER_WISH_LIST", primary_key: "UWL_WISH_LIST_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "USC_USER_CART",  null: false
    t.bigint "COM_CONTENT_ID", null: false
    t.index ["COM_CONTENT_ID"], name: "RefCDP_CONTENT169", using: :btree
    t.index ["USC_USER_CART", "COM_CONTENT_ID"], name: "USER_WISH_LIST.USER_CART.CONTENT_ID.UK", unique: true, using: :btree
  end

  create_table "CDP_VOLUME_ISSUE", primary_key: ["VOI_VOL_ISSUE_ID", "COM_CONTENT_ID"], force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "VOI_VOL_ISSUE_ID",                                                        null: false
    t.bigint   "COM_CONTENT_ID",                                                          null: false
    t.string   "VOI_VOLUME_NUMBER",      limit: 6,                                        null: false
    t.string   "VOI_VOLUME_TITLE",       limit: 500
    t.string   "VOI_ISSUE_TYPE",         limit: 20
    t.string   "VOI_ISSUE_NUMBER_BEGIN", limit: 6
    t.string   "VOI_ISSUE_NUMBER_END",   limit: 6
    t.string   "VOI_ISSUE_SUPPLEMENT",   limit: 20
    t.string   "VOI_ISSUE_PART_START",   limit: 6
    t.string   "VOI_ISSUE_PART_END",     limit: 6
    t.string   "VOI_ISSUE_SEQUENCE",     limit: 20
    t.string   "VOI_COVER_DATE",         limit: 20
    t.string   "VOI_COVER_DISPLAY",      limit: 50
    t.string   "VOI_ISSUE_URL"
    t.string   "DELETED_IND",            limit: 1,                                        null: false
    t.string   "CREATED_BY",             limit: 50,                                       null: false
    t.datetime "CREATED_DATE",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",         limit: 50,                                       null: false
    t.datetime "LASTUPDATED_DATE"
  end

  create_table "CDP_WFM_LOGS", primary_key: "WFL_WFM_LOGS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=latin1" do |t|
    t.bigint   "USE_USER_ID",                                                             null: false
    t.bigint   "PUB_PUBLISHER_ID"
    t.string   "WFL_SECTION",          limit: 50,                                         null: false
    t.string   "WFL_ROOT_DIR",         limit: 100,                                        null: false
    t.string   "WFL_EFF_DIR_PATH",     limit: 100,                                        null: false
    t.string   "WFL_EFF_FILES_DIRS",   limit: 500
    t.string   "WFL_TASK_PERFORMED",   limit: 50,                                         null: false
    t.text     "WFL_TASK_DESCRIPTION", limit: 65535
    t.boolean  "WFL_MAIL_SENT"
    t.string   "CREATED_BY",           limit: 50,                                         null: false
    t.datetime "CREATED_DATE",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",       limit: 50
    t.datetime "LASTUPDATED_DATE"
  end

  create_table "CONTENT_FEED_SETTINGS", primary_key: "CONTENT_CONFIG_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint "CONTENT_ID",                                           null: false
    t.string "BROWSABLE_UNITS",            limit: 100
    t.string "INDEXABLE_UNITS",            limit: 100
    t.string "PRINTABLE_UNITS",            limit: 100
    t.string "COPYING_UNITS",              limit: 100
    t.string "SHOW_PARTNER_ADVERTISEMENT", limit: 1,   default: "Z", null: false
    t.string "SHOW_ILLUSTRATIONS",         limit: 1,   default: "Z", null: false
    t.string "CONTENT_LOCATION",           limit: 100
    t.index ["CONTENT_ID"], name: "CONTENT_ID", using: :btree
    t.index ["CONTENT_ID"], name: "CONTENT_ID_2", unique: true, using: :btree
  end

  create_table "CTS_BATCH_DETAILS", primary_key: "BAT_BATCH_DETAILS_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "BAT_CONVERSION_STATUS",                                                    null: false
    t.bigint   "COB_CONVERSION_BATCH_ID",                                                  null: false
    t.bigint   "COM_CONTENT_ID",                                                           null: false
    t.datetime "CREATED_DATE"
    t.string   "LASTUPDATED_BY",          limit: 50,  default: "superadmin",               null: false
    t.datetime "LASTUPDATED_DATE",                    default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "SHORT_DESC",              limit: 256
    t.index ["COB_CONVERSION_BATCH_ID"], name: "COB_CONVERSION_BATCH_ID", using: :btree
    t.index ["COM_CONTENT_ID"], name: "PCO_PUBLISHER_CONTENT_INVENTORY_ID", using: :btree
  end

  create_table "CTS_CONTENT_FILES", primary_key: "COF_CONTENT_FILE_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "COF_SEQUENCE_NO"
    t.string  "COF_COMMENTS",                       limit: 1024
    t.bigint  "PCO_PUBLISHER_CONTENT_INVENTORY_ID"
    t.string  "COF_FILE_NAME",                      limit: 128,  null: false
    t.string  "COF_FILE_TYPE",                      limit: 10
  end

  create_table "CTS_CONTENT_HISTORY", primary_key: "COH_CONTENT_HISTORY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint   "COH_STATUS",                                          null: false
    t.text     "COH_COMMENTS",                       limit: 16777215
    t.datetime "COH_UPDATE_DATE",                                     null: false
    t.bigint   "COH_UPDATED_BY",                                      null: false
    t.bigint   "PCO_PUBLISHER_CONTENT_INVENTORY_ID",                  null: false
    t.index ["COH_STATUS"], name: "COH_STATUS", using: :btree
    t.index ["PCO_PUBLISHER_CONTENT_INVENTORY_ID"], name: "PCO_PUBLISHER_CONTENT_INVENTORY_ID", using: :btree
    t.index ["PCO_PUBLISHER_CONTENT_INVENTORY_ID"], name: "PCO_PUBLISHER_CONTENT_INVENTOR_2", using: :btree
  end

  create_table "CTS_CONVERSION_BATCH", primary_key: "COB_CONVERSION_BATCH_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "COB_BATCH_NAME",            limit: 100,                                      null: false
    t.bigint   "COB_CONVERSION_PARTNER_ID"
    t.string   "COB_BATCH_STATUS",          limit: 100, default: "PENDING",                  null: false
    t.string   "COB_SERVER",                limit: 100
    t.datetime "CREATED_DATE",                          default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "LASTUPDATED_DATE",                                                           null: false
    t.datetime "COB_COMPLETION_DATE"
    t.string   "CREATED_BY",                limit: 50,                                       null: false
    t.string   "LASTUPDATEDBY",             limit: 50,                                       null: false
    t.string   "DELETED_IND",               limit: 1,   default: "N",                        null: false
  end

  create_table "CTS_CONVERSION_PARTNER", primary_key: "COC_CONVERSION_PARTNER_ID", id: :integer, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.datetime "CREATED_DATE",                             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "LASTUPDATED_BY",              limit: 50,                                        null: false
    t.string   "CREATED_BY",                  limit: 50,                                        null: false
    t.string   "COC_CONTENT_UPLOAD_LOCATION", limit: 256,                                       null: false
    t.string   "COC_CONVERSION_PARTNER_NAME", limit: 100,                                       null: false
    t.string   "COC_PRIMARY_CONTACT_NAME",    limit: 100,                                       null: false
    t.string   "COC_PRIMARY_EMAIL",                                                             null: false
    t.string   "COC_SECONDARY_CONTACT_NAME",  limit: 100,                                       null: false
    t.string   "COC_ADDRESS",                 limit: 1024
    t.string   "COC_CODE",                    limit: 15,                                        null: false
    t.string   "COC_PHONE_NUMBER",            limit: 256
  end

  create_table "CTS_ERROR_LOG", primary_key: "CEL_ERROR_LOG_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "CEL_PRIMARY_ISBN",      limit: 60,  default: "", null: false
    t.string "CEL_STATUS",            limit: 512,              null: false
    t.string "CEL_PUB_CODE",          limit: 100,              null: false
    t.bigint "CUF_UPLOADED_FILES_ID",                          null: false
  end

  create_table "CTS_FORMAT_MAPPING", primary_key: "FOM_FORMAT_MAPPING_ID", force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "FOM_FORMAT",                           null: false
    t.string  "FOM_FORMAT_MAPPING_TYPE",   limit: 20
    t.integer "COC_CONVERSION_PARTNER_ID",            null: false
  end

  create_table "CTS_ONIX_ERROR_LOG", primary_key: "COR_ERROR_URL_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "COR_ERROR_URL",          limit: 150,                                      null: false
    t.datetime "COR_ERROR_DATE_SERVICE",             default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "COR_ERROR_REASON",       limit: 150
  end

  create_table "CTS_PARTNER_SITE_LOCATION", primary_key: "COP_PARTNER_FTP_DATA_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string  "COP_SITE_LOCATION",         limit: 128, null: false
    t.string  "COP_LOGIN_NAME",            limit: 30,  null: false
    t.string  "COP_LOGIN_PASSWORD",        limit: 50
    t.integer "COC_CONVERSION_PARTNER_ID",             null: false
  end

  create_table "CTS_PUBLISHER_CONTENT_INVENTORY", primary_key: "PCO_PUBLISHER_CONTENT_INVENTORY_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "PCO_STATUS",                limit: 3,                                         null: false
    t.datetime "CREATED_DATE",                           default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "LASTUPDATED_DATE",                                                            null: false
    t.date     "PCO_CONTENT_RECEIVED_DATE"
    t.string   "PCO_COMMENTS",              limit: 1000
    t.string   "PCO_FILE_NAME",             limit: 100
    t.string   "PCO_FILE_TYPE",             limit: 30
    t.bigint   "COM_CONTENT_ID",                                                              null: false
    t.integer  "COC_CONVERSION_PARTNER_ID"
    t.string   "CUF_UPLOADED_FILE_NAME",    limit: 1000
    t.index ["COM_CONTENT_ID"], name: "COM_CONTENT_ID", using: :btree
  end

  create_table "CTS_UPLOADED_FILES", primary_key: "CUF_UPLOADED_FILES_ID", id: :bigint, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "CUF_FILE_NAME",            limit: 150,                                       null: false
    t.string   "CUF_UPLOADED_BY",          limit: 50,                                        null: false
    t.string   "CUF_STATUS",               limit: 100,                                       null: false
    t.string   "CUF_UPDATED_BY",           limit: 50,                                        null: false
    t.datetime "CUF_UPDATE_DATE",                       default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "CUF_UPLOADED_DATE",                                                          null: false
    t.string   "CUF_UPLOAD_COMMENTS",      limit: 1000
    t.string   "CUF_UPLOAD_TYPE",          limit: 9,    default: "BOOK"
    t.string   "CUF_UPLOADED_FILE_LOCALE", limit: 5,    default: "en",                       null: false
  end

  create_table "FEED_CONTENT_HISTORIES", primary_key: "CONTENT_FEED_HISTORY_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer "FEED_HISTORY_ID",              null: false, unsigned: true
    t.bigint  "CONTENT_ID",                   null: false
    t.string  "PERMISSIONS_USED", limit: 500, null: false
  end

  create_table "FEED_DOMAIN_INFO", primary_key: "FEED_DOMAIN_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string "FEED_DOMAIN_CATEGORY", limit: 50,  null: false
    t.string "FEED_DOMAIN_KEY",      limit: 100, null: false
    t.string "FEED_DOMAIN_VALUE",    limit: 100, null: false
    t.index ["FEED_DOMAIN_CATEGORY", "FEED_DOMAIN_KEY"], name: "ID_CAT_KEY1", using: :btree
  end

  create_table "FEED_HISTORIES", primary_key: "FEED_HISTORY_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "PARTNER_ID",   limit: 2
    t.bigint   "PUBLISHER_ID"
    t.string   "TYPE",         limit: 100,                                       null: false
    t.string   "STATE",        limit: 1000, default: "",                         null: false
    t.datetime "UPDATED_DATE",              default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "UPDATED_BY",   limit: 50,   default: "",                         null: false
    t.index ["PUBLISHER_ID", "PARTNER_ID"], name: "ID_FH_PUB_PARTNER3", using: :btree
    t.index ["TYPE"], name: "ID_FH_TYPE2", using: :btree
    t.index ["UPDATED_DATE"], name: "ID_FH_UPDATED_DATE1", using: :btree
  end

  create_table "FEED_PARTNERS", primary_key: "PARTNER_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string   "PARTNER_CODE",                limit: 20,                                       null: false
    t.string   "PARTNER_NAME",                limit: 100,                                      null: false
    t.string   "PARTNER_USER_ID",             limit: 50
    t.string   "PASSWORD",                    limit: 50
    t.string   "IP_RANGE",                    limit: 500
    t.string   "METADATA_FORMAT",             limit: 2,                                        null: false
    t.string   "AUTH_SCHEMES",                limit: 12
    t.string   "SUPPORTED_CONTENT_TYPES",     limit: 26
    t.string   "SUPPORTED_SCHEMA",            limit: 14,                                       null: false
    t.string   "PARTNER_CONTACT_PERSON_NAME", limit: 100
    t.string   "PARTNER_CONTACT_EMAIL",       limit: 100
    t.string   "PARTNER_WEBSITE",             limit: 100
    t.string   "PARTNER_STATUS",              limit: 8,                                        null: false
    t.string   "PARTNER_CONTACT_ADDRESS",     limit: 100
    t.string   "PARTNER_CONTACT_COUNTRY",     limit: 100
    t.string   "PARTNER_CONTACT_PHONE",       limit: 20
    t.string   "PARTNER_CONTACT_FAX",         limit: 20
    t.datetime "CREATED_DATE",                            default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "CREATED_BY",                  limit: 50,                                       null: false
    t.datetime "UPDATED_DATE",                                                                 null: false
    t.string   "UPDATED_BY",                  limit: 50,                                       null: false
    t.index ["PARTNER_CODE"], name: "PARTNER_CODE", unique: true, using: :btree
    t.index ["PARTNER_USER_ID"], name: "PARTNER_USER_ID", unique: true, using: :btree
  end

  create_table "PARTNER_ACCESS_PERMISSIONS", primary_key: "PARTNER_ACCESS_ID", unsigned: true, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.integer  "PARTNER_ID",           limit: 2,                                        null: false, unsigned: true
    t.bigint   "PUBLISHER_ID",                                                          null: false
    t.boolean  "ACCESS_IMAGES"
    t.boolean  "ACCESS_TEXT"
    t.boolean  "ACCESS_COORDINATES"
    t.boolean  "ACCESS_COVERS"
    t.string   "ACCESS_EBOOKS",        limit: 100
    t.string   "ACCESS_STATUS",        limit: 1,                                        null: false
    t.integer  "USE_DEFAULT_GROUP_ID",                                                               unsigned: true
    t.boolean  "USE_SCRAMBLED_TEXT",               default: false,                      null: false
    t.boolean  "USE_RESTRICTED_UNITS",             default: false,                      null: false
    t.boolean  "USE_INDEXABLE_UNITS",              default: false,                      null: false
    t.datetime "CREATED_DATE",                     default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string   "CREATED_BY",           limit: 50,                                       null: false
    t.datetime "UPDATED_DATE",                                                          null: false
    t.string   "UPDATED_BY",           limit: 50,                                       null: false
    t.index ["ACCESS_STATUS"], name: "ID_ACCESS_STATUS1", using: :btree
    t.index ["PARTNER_ID"], name: "PARTNER_ID", using: :btree
    t.index ["PUBLISHER_ID", "PARTNER_ID"], name: "PUBLISHER_ID_2", unique: true, using: :btree
    t.index ["PUBLISHER_ID"], name: "PUBLISHER_ID", using: :btree
  end

  create_table "content_live", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.string  "isbn",  limit: 30,                          null: false
    t.decimal "price",            precision: 10, scale: 2
  end

  create_table "content_livelit", id: false, force: :cascade, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8" do |t|
    t.bigint  "isbn",                           null: false
    t.decimal "price", precision: 10, scale: 2
  end

end
