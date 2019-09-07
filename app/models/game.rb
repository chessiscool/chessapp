# frozen_string_literal: true

# Game class is defining the model associated with GamesController
class Game < ApplicationRecord
  has_many :user_games
  has_many :users, through: :user_games
  has_many :pieces
  scope :available, -> { where('white_player_id IS NULL or black_player_id IS NULL') } # rubocop:disable LineLength

  after_create :populate_board!

  def contains_piece?(x_coord, y_coord)
    if pieces.where("(x_coord = ? AND y_coord = ?)", x_coord, y_coord).any?
      return true
    else
      return false
    end
  end

  def populate_board!
   # WHITE PIECES
      # Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, white: true, x_coord: x_coord, y_coord: 7, user_id: white_player_user_id, name: "Pawn_white")
      end

      # Rooks
      [1, 8].each do |x_coord|
        Rook.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Rook_white")
      end

      # Knights
      [2, 7].each do |x_coord|
        Knight.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Knight_white")
      end

      #Bishops
      [3, 6].each do |x_coord|
        Bishop.create(game_id: id, white: true, x_coord: x_coord, y_coord: 8, user_id: white_player_user_id, name: "Bishop_white")
      end

      #King
      King.create(game_id: id, white: true, x_coord: 5, y_coord: 8, user_id: white_player_user_id, name: "King_white")

      #Queen
      Queen.create(game_id: id, white: true, x_coord: 4, y_coord: 8, user_id: white_player_user_id, name: "Queen_white")

    # BLACK PIECES
      # Pawns
      (1..8).each do |x_coord|
        Pawn.create(game_id: id, white: false, x_coord: x_coord, y_coord: 2, user_id: black_player_user_id, name: "Pawn_black")
      end

      # Rooks
      [1, 8].each do |x_coord|
        Rook.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Rook_black")
      end

      # Knights
      [2, 7].each do |x_coord|
        Knight.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Knight_black")
      end

      #Bishops
      [3, 6].each do |x_coord|
        Bishop.create(game_id: id, white: false, x_coord: x_coord, y_coord: 1, user_id: black_player_user_id, name: "Bishop_black")
      end

      #King
      King.create(game_id: id, white: false, x_coord: 5, y_coord: 1, user_id: black_player_user_id, name: "King_black")

      #Queen
      Queen.create(game_id: id, white: false, x_coord: 4, y_coord: 1, user_id: black_player_user_id, name: "Queen_black")
  end

end
