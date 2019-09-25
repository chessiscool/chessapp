# frozen_string_literal: true

# Piece class is defining the model associated with PiecesController
class Piece < ApplicationRecord
  belongs_to :game, dependent: :destroy
  belongs_to :user, dependent: :destroy

  def update_piece(x, y)
    update_attributes(x_position: x, y_position: y)
  end
end
