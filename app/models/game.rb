# frozen_string_literal: true

# Game class is defining the model associated with GamesController
class Game < ApplicationRecord
  has_many :pieces, dependent: :destroy
end
