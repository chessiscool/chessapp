# frozen_string_literal: true

# AddIndexToGames class is to add indices to the
# already created :games database table
class AddIndexToGames < ActiveRecord::Migration[5.2]
  def change
    add_index :games, %i[name black_player_id white_player_id]
    add_index :games, :name
  end
end
