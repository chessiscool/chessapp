# frozen_string_literal: true

# King class is defining the model associated with PiecesController
# The King class inherits from the Piece class
class King < Piece
  belongs_to :piece

  def valid_move?(x_position, y_position)
    if diagonal_move?(x, y)
      return true if unoccupied?(x, y)
      return false if occupied_by_opposing_piece?(x, y) && piece_type == king

    elsif vertical_move?(x, y)
      return true if unoccupied?(x, y)
      return false if occupied_by_opposing_piece?(x, y) && piece_type == king

    else horizontal_move?(x, y)
      return true if unoccupied?(x, y)
      return false if occupied_by_opposing_piece?(x, y) && piece_type == king
    end
  end

  def capture

  end
end


