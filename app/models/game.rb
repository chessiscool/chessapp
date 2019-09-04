# frozen_string_literal: true

# Game class is defining the model associated with GamesController
class Game < ApplicationRecord
  has_many :pieces, dependent: :destroy
  scope :available, -> { where('white_player_id IS NULL or black_player_id IS NULL') } # rubocop:disable LineLength
end
