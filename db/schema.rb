# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema
# definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach
# (the more migrations you'll amass, the slower it'll run and the greater
# likelihood for issues).
#
# It's strongly recommended that you check this file into your version
# control system.

ActiveRecord::Schema.define(version: 20_190_827_020_225) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'games', force: :cascade do |t|
    t.string 'name'
    t.integer 'white_player_id'
    t.integer 'black_player_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index %w[name black_player_id white_player_id],
            name: 'index_games_on_name_and_black_player_id_and_white_player_id'
    t.index ['name'], name: 'index_games_on_name'
  end

  create_table 'pawns', force: :cascade do |t|
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'pieces', force: :cascade do |t|
    t.integer 'x_position'
    t.integer 'y_position'
    t.string 'piece_type'
    t.integer 'player_id'
    t.integer 'game_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'type'
    t.index ['game_id'], name: 'index_pieces_on_game_id'
    t.index %w[x_position y_position player_id],
            name: 'index_pieces_on_x_position_and_y_position_and_player_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'user_name', default: '', null: false
    t.integer 'user_id', null: false
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'],
            name: 'index_users_on_reset_password_token', unique: true
    t.index ['user_id'], name: 'index_users_on_user_id', unique: true
    t.index ['user_name'], name: 'index_users_on_user_name', unique: true
  end
end
