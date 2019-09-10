# frozen_string_literal: true

# AddOmniauthToUsers class is to add data to the
# already created :users database table
class AddOmniauthToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :name, :string
    add_column :users, :image, :text
  end
end
