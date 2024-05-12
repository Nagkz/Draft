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

ActiveRecord::Schema.define(version: 2024_05_12_061155) do

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_comments_on_player_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "etags", force: :cascade do |t|
    t.string "expectation"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "comment_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["comment_id"], name: "index_favorites_on_comment_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_likes_on_player_id"
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "mfctags", force: :cascade do |t|
    t.string "main_fc_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mfitags", force: :cascade do |t|
    t.string "main_fi_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mfotags", force: :cascade do |t|
    t.string "main_fo_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mptags", force: :cascade do |t|
    t.string "main_p_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "otags", force: :cascade do |t|
    t.string "original"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_etag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "etag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["etag_id"], name: "index_player_etag_relations_on_etag_id"
    t.index ["player_id"], name: "index_player_etag_relations_on_player_id"
  end

  create_table "player_mfctag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "mfctag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mfctag_id"], name: "index_player_mfctag_relations_on_mfctag_id"
    t.index ["player_id"], name: "index_player_mfctag_relations_on_player_id"
  end

  create_table "player_mfitag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "mfitag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mfitag_id"], name: "index_player_mfitag_relations_on_mfitag_id"
    t.index ["player_id"], name: "index_player_mfitag_relations_on_player_id"
  end

  create_table "player_mfotag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "mfotag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mfotag_id"], name: "index_player_mfotag_relations_on_mfotag_id"
    t.index ["player_id"], name: "index_player_mfotag_relations_on_player_id"
  end

  create_table "player_mptag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "mptag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mptag_id"], name: "index_player_mptag_relations_on_mptag_id"
    t.index ["player_id"], name: "index_player_mptag_relations_on_player_id"
  end

  create_table "player_otag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "otag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["otag_id"], name: "index_player_otag_relations_on_otag_id"
    t.index ["player_id"], name: "index_player_otag_relations_on_player_id"
  end

  create_table "player_sfctag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "sfctag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_sfctag_relations_on_player_id"
    t.index ["sfctag_id"], name: "index_player_sfctag_relations_on_sfctag_id"
  end

  create_table "player_sfitag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "sfitag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_sfitag_relations_on_player_id"
    t.index ["sfitag_id"], name: "index_player_sfitag_relations_on_sfitag_id"
  end

  create_table "player_sfotag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "sfotag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_sfotag_relations_on_player_id"
    t.index ["sfotag_id"], name: "index_player_sfotag_relations_on_sfotag_id"
  end

  create_table "player_sptag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "sptag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_sptag_relations_on_player_id"
    t.index ["sptag_id"], name: "index_player_sptag_relations_on_sptag_id"
  end

  create_table "player_tag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "tag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_tag_relations_on_player_id"
    t.index ["tag_id"], name: "index_player_tag_relations_on_tag_id"
  end

  create_table "player_vlltag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vlltag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vlltag_relations_on_player_id"
    t.index ["vlltag_id"], name: "index_player_vlltag_relations_on_vlltag_id"
  end

  create_table "player_vlrtag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vlrtag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vlrtag_relations_on_player_id"
    t.index ["vlrtag_id"], name: "index_player_vlrtag_relations_on_vlrtag_id"
  end

  create_table "player_vltag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vltag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vltag_relations_on_player_id"
    t.index ["vltag_id"], name: "index_player_vltag_relations_on_vltag_id"
  end

  create_table "player_vrtag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vrtag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vrtag_relations_on_player_id"
    t.index ["vrtag_id"], name: "index_player_vrtag_relations_on_vrtag_id"
  end

  create_table "player_vtag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vtag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vtag_relations_on_player_id"
    t.index ["vtag_id"], name: "index_player_vtag_relations_on_vtag_id"
  end

  create_table "player_vutag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "vutag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_vutag_relations_on_player_id"
    t.index ["vutag_id"], name: "index_player_vutag_relations_on_vutag_id"
  end

  create_table "player_wfctag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "wfctag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_wfctag_relations_on_player_id"
    t.index ["wfctag_id"], name: "index_player_wfctag_relations_on_wfctag_id"
  end

  create_table "player_wfitag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "wfitag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_wfitag_relations_on_player_id"
    t.index ["wfitag_id"], name: "index_player_wfitag_relations_on_wfitag_id"
  end

  create_table "player_wfotag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "wfotag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_wfotag_relations_on_player_id"
    t.index ["wfotag_id"], name: "index_player_wfotag_relations_on_wfotag_id"
  end

  create_table "player_wptag_relations", force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "wptag_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_player_wptag_relations_on_player_id"
    t.index ["wptag_id"], name: "index_player_wptag_relations_on_wptag_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name"
    t.string "furigana"
    t.string "belong"
    t.string "throws"
    t.string "bats"
    t.integer "height"
    t.integer "weight"
    t.date "birthday"
    t.string "prefecture"
    t.text "career"
    t.text "explanation"
    t.text "injury"
    t.integer "max"
    t.integer "powerful"
    t.integer "control"
    t.integer "stamina"
    t.integer "breaking"
    t.integer "meet"
    t.integer "power"
    t.integer "running"
    t.integer "defence"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "league"
    t.string "category"
    t.integer "user_id"
    t.string "summarytext"
    t.integer "fyear"
    t.integer "cyear"
    t.integer "month"
    t.integer "date"
    t.string "copy"
    t.string "future"
    t.string "explanation2"
    t.string "explanation3"
    t.string "subtitle1"
    t.string "subtitle2"
    t.string "subtitle3"
    t.string "url"
  end

  create_table "ranks", force: :cascade do |t|
    t.string "body"
    t.integer "user_id", null: false
    t.integer "player_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["player_id"], name: "index_ranks_on_player_id"
    t.index ["user_id"], name: "index_ranks_on_user_id"
  end

  create_table "requests", force: :cascade do |t|
    t.text "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "purpose"
    t.integer "user_id"
  end

  create_table "sfctags", force: :cascade do |t|
    t.string "sub_fc_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sfitags", force: :cascade do |t|
    t.string "sub_fi_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sfotags", force: :cascade do |t|
    t.string "sub_fo_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sptags", force: :cascade do |t|
    t.string "sub_p_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tags", force: :cascade do |t|
    t.string "body"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.text "profile"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "vlltags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vlrtags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vltags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vrtags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vtags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "vutags", force: :cascade do |t|
    t.string "variety"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wfctags", force: :cascade do |t|
    t.string "whole_fc_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wfitags", force: :cascade do |t|
    t.string "whole_fi_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wfotags", force: :cascade do |t|
    t.string "whole_fo_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "wptags", force: :cascade do |t|
    t.string "whole_p_position"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "comments", "players"
  add_foreign_key "comments", "users"
  add_foreign_key "favorites", "comments"
  add_foreign_key "favorites", "users"
  add_foreign_key "likes", "players"
  add_foreign_key "likes", "users"
  add_foreign_key "player_etag_relations", "etags"
  add_foreign_key "player_etag_relations", "players"
  add_foreign_key "player_mfctag_relations", "mfctags"
  add_foreign_key "player_mfctag_relations", "players"
  add_foreign_key "player_mfitag_relations", "mfitags"
  add_foreign_key "player_mfitag_relations", "players"
  add_foreign_key "player_mfotag_relations", "mfotags"
  add_foreign_key "player_mfotag_relations", "players"
  add_foreign_key "player_mptag_relations", "mptags"
  add_foreign_key "player_mptag_relations", "players"
  add_foreign_key "player_otag_relations", "otags"
  add_foreign_key "player_otag_relations", "players"
  add_foreign_key "player_sfctag_relations", "players"
  add_foreign_key "player_sfctag_relations", "sfctags"
  add_foreign_key "player_sfitag_relations", "players"
  add_foreign_key "player_sfitag_relations", "sfitags"
  add_foreign_key "player_sfotag_relations", "players"
  add_foreign_key "player_sfotag_relations", "sfotags"
  add_foreign_key "player_sptag_relations", "players"
  add_foreign_key "player_sptag_relations", "sptags"
  add_foreign_key "player_tag_relations", "players"
  add_foreign_key "player_tag_relations", "tags"
  add_foreign_key "player_vlltag_relations", "players"
  add_foreign_key "player_vlltag_relations", "vlltags"
  add_foreign_key "player_vlrtag_relations", "players"
  add_foreign_key "player_vlrtag_relations", "vlrtags"
  add_foreign_key "player_vltag_relations", "players"
  add_foreign_key "player_vltag_relations", "vltags"
  add_foreign_key "player_vrtag_relations", "players"
  add_foreign_key "player_vrtag_relations", "vrtags"
  add_foreign_key "player_vtag_relations", "players"
  add_foreign_key "player_vtag_relations", "vtags"
  add_foreign_key "player_vutag_relations", "players"
  add_foreign_key "player_vutag_relations", "vutags"
  add_foreign_key "player_wfctag_relations", "players"
  add_foreign_key "player_wfctag_relations", "wfctags"
  add_foreign_key "player_wfitag_relations", "players"
  add_foreign_key "player_wfitag_relations", "wfitags"
  add_foreign_key "player_wfotag_relations", "players"
  add_foreign_key "player_wfotag_relations", "wfotags"
  add_foreign_key "player_wptag_relations", "players"
  add_foreign_key "player_wptag_relations", "wptags"
  add_foreign_key "ranks", "players"
  add_foreign_key "ranks", "users"
end
