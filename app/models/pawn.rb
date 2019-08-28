# frozen_string_literal: true

# Pawn class is defining the model associated with PiecesController
# The Pawn class inherits from the Piece Class
class Pawn < Piece
  belongs_to :piece
end
