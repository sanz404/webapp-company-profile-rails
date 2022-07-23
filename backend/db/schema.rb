# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_07_22_155429) do

  create_table "abouts", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "image"
    t.string "title", null: false
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image"], name: "index_abouts_on_image"
    t.index ["is_published"], name: "index_abouts_on_is_published"
    t.index ["title"], name: "index_abouts_on_title"
  end

  create_table "article_categories", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "category_article_id", null: false
    t.bigint "article_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_categories_on_article_id"
    t.index ["category_article_id"], name: "index_article_categories_on_category_article_id"
  end

  create_table "article_comments", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.text "description", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_article_comments_on_article_id"
    t.index ["user_id"], name: "index_article_comments_on_user_id"
  end

  create_table "articles", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "image"
    t.string "slug", null: false
    t.string "title", null: false
    t.text "content", size: :long, null: false
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image"], name: "index_articles_on_image"
    t.index ["is_published"], name: "index_articles_on_is_published"
    t.index ["slug"], name: "index_articles_on_slug"
    t.index ["title"], name: "index_articles_on_title"
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "category_articles", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_category_articles_on_name"
  end

  create_table "category_faqs", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_category_faqs_on_name"
  end

  create_table "category_products", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_category_products_on_name"
  end

  create_table "category_projects", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_category_projects_on_name"
  end

  create_table "contacts", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.text "address"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_contacts_on_email"
    t.index ["name"], name: "index_contacts_on_name"
    t.index ["phone"], name: "index_contacts_on_phone"
    t.index ["website"], name: "index_contacts_on_website"
  end

  create_table "contents", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "key_name"
    t.text "key_value", size: :long
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["key_name"], name: "index_contents_on_key_name"
  end

  create_table "countries", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "code"
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_countries_on_code"
    t.index ["name"], name: "index_countries_on_name"
  end

  create_table "email_verifications", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "code", null: false
    t.string "token", null: false
    t.boolean "email_confirmed", default: false
    t.boolean "is_expired", default: false
    t.datetime "expired_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["code"], name: "index_email_verifications_on_code"
    t.index ["email_confirmed"], name: "index_email_verifications_on_email_confirmed"
    t.index ["expired_at"], name: "index_email_verifications_on_expired_at"
    t.index ["is_expired"], name: "index_email_verifications_on_is_expired"
    t.index ["token"], name: "index_email_verifications_on_token"
    t.index ["user_id"], name: "index_email_verifications_on_user_id"
  end

  create_table "faqs", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "question", null: false
    t.text "answer", size: :long, null: false
    t.integer "sort", default: 0
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_faqs_on_category_id"
    t.index ["is_published"], name: "index_faqs_on_is_published"
    t.index ["question"], name: "index_faqs_on_question"
    t.index ["sort"], name: "index_faqs_on_sort"
  end

  create_table "features", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "icon"
    t.string "title", null: false
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["icon"], name: "index_features_on_icon"
    t.index ["is_published"], name: "index_features_on_is_published"
    t.index ["title"], name: "index_features_on_title"
  end

  create_table "messages", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "email", null: false
    t.string "phone", null: false
    t.text "message", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_messages_on_email"
    t.index ["full_name"], name: "index_messages_on_full_name"
    t.index ["phone"], name: "index_messages_on_phone"
  end

  create_table "notifications", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "subject", null: false
    t.string "sort_content", null: false
    t.text "full_content", null: false
    t.datetime "readed_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["readed_at"], name: "index_notifications_on_readed_at"
    t.index ["sort_content"], name: "index_notifications_on_sort_content"
    t.index ["subject"], name: "index_notifications_on_subject"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "products", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.string "image"
    t.decimal "price", precision: 18, scale: 4, default: "0.0"
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_products_on_category_id"
    t.index ["image"], name: "index_products_on_image"
    t.index ["is_published"], name: "index_products_on_is_published"
    t.index ["name"], name: "index_products_on_name"
    t.index ["price"], name: "index_products_on_price"
  end

  create_table "projects", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.string "name", null: false
    t.string "image"
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["category_id"], name: "index_projects_on_category_id"
    t.index ["image"], name: "index_projects_on_image"
    t.index ["is_published"], name: "index_projects_on_is_published"
    t.index ["name"], name: "index_projects_on_name"
  end

  create_table "teams", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.string "image"
    t.string "name", null: false
    t.string "position"
    t.text "description"
    t.boolean "is_published", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["image"], name: "index_teams_on_image"
    t.index ["is_published"], name: "index_teams_on_is_published"
    t.index ["name"], name: "index_teams_on_name"
    t.index ["position"], name: "index_teams_on_position"
  end

  create_table "users", charset: "latin1", options: "ENGINE=MyISAM", force: :cascade do |t|
    t.bigint "country_id"
    t.string "username", limit: 191, null: false
    t.string "email", limit: 191, null: false
    t.string "phone"
    t.text "address1"
    t.text "address2"
    t.string "city"
    t.string "zip_code"
    t.string "password_digest"
    t.boolean "is_admin", default: true
    t.boolean "status", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city"], name: "index_users_on_city"
    t.index ["country_id"], name: "index_users_on_country_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["is_admin"], name: "index_users_on_is_admin"
    t.index ["phone"], name: "index_users_on_phone"
    t.index ["status"], name: "index_users_on_status"
    t.index ["username"], name: "index_users_on_username"
    t.index ["zip_code"], name: "index_users_on_zip_code"
  end

end
