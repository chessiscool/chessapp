# frozen_string_literal: true

# Game class is defining the model associated with GamesController
class Game < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :pieces, dependent: :destroy
  scope :available, -> { where('white_player_id IS NULL or black_player_id IS NULL') } # rubocop:disable LineLength

  after_create :populate_board!

  def populate_board! # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    # WHITE PIECES
    # Pawns
    (1..8).each do |x_position|
      Pawn.create(game_id: id,
                  x_position: x_position,
                  y_position: 7,
                  type: 'Pawn')
    end

    # Rooks
    [1, 8].each do |x_position|
      Rook.create(game_id: id,
                  x_position: x_position,
                  y_position: 8,
                  type: 'Rook')
    end

    # Knights
    [2, 7].each do |x_position|
      Knight.create(game_id: id,
                    x_position: x_position,
                    y_position: 8,
                    type: 'Knight')
    end

    # Bishops
    [3, 6].each do |x_position|
      Bishop.create(game_id: id,
                    x_position: x_position,
                    y_position: 8,
                    type: 'Bishop')
    end

    # King
    King.create(game_id: id,
                x_position: 5,
                y_position: 8,
                type: 'King')

    # Queen
    Queen.create(game_id: id,
                 x_position: 4,
                 y_position: 8,
                 type: 'Queen')

    # BLACK PIECES
    # Pawns
    (1..8).each do |x_position|
      Pawn.create(game_id: id,
                  x_position: x_position,
                  y_position: 2,
                  type: 'Pawn')
    end

    # Rooks
    [1, 8].each do |x_position|
      Rook.create(game_id: id,
                  x_position: x_position,
                  y_position: 1,
                  type: 'Rook')
    end

    # Knights
    [2, 7].each do |x_position|
      Knight.create(game_id: id,
                    x_position: x_position,
                    y_position: 1,
                    type: 'Knight')
    end

    # Bishops
    [3, 6].each do |x_position|
      Bishop.create(game_id: id,
                    x_position: x_position,
                    y_position: 1,
                    type: 'Bishop')
    end

    # King
    King.create(game_id: id,
                x_position: 5,
                y_position: 1,
                type: 'King')

    # Queen
    Queen.create(game_id: id,
                 x_position: 4,
                 y_position: 1,
                 type: 'Queen')
  end
end
