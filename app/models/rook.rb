# frozen_string_literal: true

# Rook class is defining the model associated with PiecesController
# The Rook class inherits from the Piece class
class Rook < Piece
  belongs_to :piece
end
