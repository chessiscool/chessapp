# frozen_string_literal: true

# Piece class is defining the model associated with PiecesController
class Piece < ApplicationRecord
  belongs_to :game, dependent: :destroy
end
