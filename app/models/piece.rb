# frozen_string_literal: true

# Piece class is defining the model associated with PiecesController
class Piece < ApplicationRecord
  belongs_to :game, dependent: :destroy
  def available_moves
    Game.all_board_coordinates.select do |coordinate_pair|
      valid_move?(coordinate_pair[0], coordinate_pair[1]) &&
        !is_obstructed?(coordinate_pair[0], coordinate_pair[1]) &&
        !occupied_by_mycolor_piece?(coordinate_pair[0], coordinate_pair[1])
    end
  end

  def valid_move?(x, y)
    return false if is_obstructed?(x, y)
    return false if occupied_by_mycolor_piece?(x, y)

    within_chessboard?(x, y)
  end

  def self.piece_types
    %w[Pawn Knight Bishop Rook Queen King]
  end

  def within_chessboard?(x, y)
    (x >= 0 && y >= 0 && x <= 7 && y <= 7 && !x.nil? && !y.nil?)
  end

  def space_occupied?(x, y)
    game.pieces.where(x_position: x, y_position: y).present?
  end

  def unoccupied?(x, y)
    !space_occupied?(x, y)
  end

  def occupied_by_mycolor_piece?(x, y)
    space_occupied?(x, y) && (piece_at(x, y).color == color)
  end

  def occupied_by_opposing_piece?(x, y)
    space_occupied?(x, y) && (piece_at(x, y).color != color)
  end

  def diagonal_move?(x, y)
    (y_position - y).abs == (x_position - x).abs
  end

  def vertical_move?(x, y)
    x_position == x && y_position != y
  end

  def horizontal_move?(x, y)
    (y_position == y) && (x_position != x) ? true : false
  end

  def horizontal_obstruction?(x_end, _y_end)
    # movement: right to left
    if x_position < x_end
      (x_position + 1).upto(x_end - 1) do |x|
        return true if space_occupied?(x, y_position)
      end
    # movement: left to right
    elsif x_position > x_end
      (x_position - 1).downto(x_end + 1) do |x|
        return true if space_occupied?(x, y_position)
      end
    end
    false
  end

  def vertical_obstruction(_x_end, y_end)
    # path is vertical down
    if y_position < y_end
      (y_position + 1).upto(y_end - 1) do |y|
        return true if space_occupied?(x_position, y)
      end
    # path is vertical up
    elsif y_position > y_end
      (y_position - 1).downto(y_end + 1) do |y|
        return true if space_occupied?(x_position, y)
      end
    end
    false
  end

  def diagonal_obstruction(x_end, y_end)
    # path is diagonal and down
    if x_position < x_end
      (x_position + 1).upto(x_end - 1) do |x|
        delta_y = x - x_position
        y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        return true if space_occupied?(x, y)
      end
    # path is diagonal and up
    elsif x_position > x_end
      (x_position - 1).downto(x_end + 1) do |x|
        delta_y = x_position - x
        y = y_end > y_position ? y_position + delta_y : y_position - delta_y
        return true if space_occupied?(x, y)
      end
    end
    false
  end

  def is_obstructed?(x, y)
    x_end = x
    y_end = y
    path = check_path(x_position, y_position, x_end, y_end)
    puts 'YOURE IN THE IS OBSTUCTED FUNCITON AND BELOW IS FUNCTIOPN'
    puts horizontal_obstruction?(2, 3)
    puts 'HERE IS A TEST'

    return horizontal_obstruction?(x_end, y_end) if path == 'horizontal'

    return vertical_obstruction(x_end, y_end) if path == 'vertical'

    return diagonal_obstruction(x_end, y_end) if path == 'diagonal'

    false
  end

  def captured(x, y)
    piece_at(x, y).update(x_position: nil, y_position: nil)
  end

  def update_location(x, y)
    update(x_position: x, y_position: y)
  end

  def move_to!(_new_x, _new_y)
    if valid_move?(x, y) && occupied_by_opposing_piece?(x, y)
      return captured(x, y)
      update_location(x, y)
    end
  end
  
  def update_piece(x, y)
    update_attributes(x_position: x, y_position: y)
  end
end
