class AddPieceIdToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :piece_id, :integer
  end
end
