# frozen_string_literal: true

# CreateGames class is to define the :games database table
class CreateGames < ActiveRecord::Migration[5.2]
  def change
    create_table :games do |t|
      t.string :name
      t.integer :white_player_id
      t.integer :black_player_id
      t.timestamps
    end
  end
end
