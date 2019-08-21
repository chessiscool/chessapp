# frozen_string_literal: true

# AddIndexToPieces class is to add indices to the
# already created :pieces database table
class AddIndexToPieces < ActiveRecord::Migration[5.2]
  def change
    add_index :pieces, %i[x_position y_position player_id]
    add_index :pieces, :game_id
  end
end
