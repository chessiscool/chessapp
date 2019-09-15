# frozen_string_literal: true

# Board class is defining the model associated with BoardsController
class Board
  # coordinates

  def available_moves(x, y)
    horizontal_left x, y
    horizontal_right x, y
    vert_up x, y
    vert_down x, y
    diagonal_up x, y
    diagonal_down x, y
  end

  def occupied?(_x, _y)
    game.pieces.where(x_position, y_position).present?
  end

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      'horizontal'
    elsif x1 == x2
      'vertical'
    else
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end

  def is_obstructed?(desireddestination) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize, Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, LineLength
    x1 = x_position
    y1 = y_position
    x2 = desireddestination[0]
    y2 = desireddestination[1]

    line = check_line(x1, y1, x2, y2)
    # horizontal left
    if line == 'horizontal' && x1 < x2
      ((x + 1)..7).each do |_x_position|
        return true if occupied?
      end
    end

    # horizontal right
    if line == 'horizontal' && x1 > x2
      ((x - 1)..7).each do |_x_position|
        return true if occupied?
      end
    end

    # verticaldown
    if line == 'vertical' && y1 < y2
      ((y - 1)..7).each do |_y_position|
        return true if occupied?
      end
    end

    # verticalup
    if line == 'vertical' && y1 > y2
      ((y + 1)..7).each do |_y_position|
        return true if occupied?
      end
    end
    return false if line == 'horizontal' || line == 'vertical'

    # diagonaldown
    if @slope.abs == 1.0 && x1 < x2
      ((x - 1)..7).each do |x_position|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x_position, y_position)
      end
    end

    # diagonalup
    if @slope.abs == 1.0 && x1 > x2
      ((x + 1)..7).each do |x_position|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x_position, y_position)
      end
    end

    # not a straight line
    if @slope.abs != 1.0
      raise 'path is not a straight line'
    else return false
    end
  end
end
