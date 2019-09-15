# frozen_string_literal: true

# Piece class is defining the model associated with PiecesController
class Piece < ActiveRecord::Base
  belongs_to :game, dependent: :destroy
end
