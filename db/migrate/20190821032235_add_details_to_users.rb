# frozen_string_literal: true

# AddDetailsToUsers class is to add data to the
# already created :users database table
class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :user_name, null: false, default: ''
      t.integer :user_id, null: false, default: ''
    end
    add_index :users, :user_name,   unique: true
    add_index :users, :user_id,     unique: true
  end
end
