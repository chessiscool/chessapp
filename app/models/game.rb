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
      Pawn.create(piece_id: id,
                  game_id: id,
                  x_position: x_position,
                  y_position: 7,
                  type: 'Pawn',
                  piece_type: 'pawn-white')
    end

    # Rooks
    [1, 8].each do |x_position|
      Rook.create(piece_id: id,
                  game_id: id,
                  x_position: x_position,
                  y_position: 8,
                  type: 'Rook',
                  piece_type: 'rook-white')
    end

    # Knights
    [2, 7].each do |x_position|
      Knight.create(piece_id: id,
                    game_id: id,
                    x_position: x_position,
                    y_position: 8,
                    type: 'Knight',
                    piece_type: 'knight-white')
    end

    # Bishops
    [3, 6].each do |x_position|
      Bishop.create(piece_id: id,
                    game_id: id,
                    x_position: x_position,
                    y_position: 8,
                    type: 'Bishop',
                    piece_type: 'bishop-white')
    end

    # King
    King.create(piece_id: id,
                game_id: id,
                x_position: 5,
                y_position: 8,
                type: 'King',
                piece_type: 'king-white')

    # Queen
    Queen.create(piece_id: id,
                game_id: id,
                 x_position: 4,
                 y_position: 8,
                 type: 'Queen',
                 piece_type: 'queen-white')

    # BLACK PIECES
    # Pawns
    (1..8).each do |x_position|
      Pawn.create(piece_id: id,
                  game_id: id,
                  x_position: x_position,
                  y_position: 2,
                  type: 'Pawn',
                  piece_type: 'pawn-black')
    end

    # Rooks
    [1, 8].each do |x_position|
      Rook.create(piece_id: id,
                  game_id: id,
                  x_position: x_position,
                  y_position: 1,
                  type: 'Rook',
                  piece_type: 'rook-black')
    end

    # Knights
    [2, 7].each do |x_position|
      Knight.create(piece_id: id,
                    game_id: id,
                    x_position: x_position,
                    y_position: 1,
                    type: 'Knight',
                    piece_type: 'knight-black')
    end

    # Bishops
    [3, 6].each do |x_position|
      Bishop.create(piece_id: id,
                    game_id: id,
                    x_position: x_position,
                    y_position: 1,
                    type: 'Bishop',
                    piece_type: 'bishop-black')
    end

    # King
    King.create(piece_id: id,
                game_id: id,
                x_position: 5,
                y_position: 1,
                type: 'King',
                piece_type: 'king-black')

    # Queen
    Queen.create(piece_id: id,
                 game_id: id,
                 x_position: 4,
                 y_position: 1,
                 type: 'Queen',
                 piece_type: 'queen-black')
  end
end
