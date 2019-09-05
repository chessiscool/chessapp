class Board

#coordinates

  def available_moves x, y
    horizontal_left x, y
    horizontal_right x, y
    vert_up x, y
    vert_down x, y
    diagonal_up x, y
    diagonal_down x, y
  end

  def occupied?(x, y)
    game.pieces.where(x_position, y_position).present?
  end

  def check_path(x1, y1, x2, y2)
    if y1 == y2
      return 'horizontal'
    elsif x1 == x2
      return 'vertical'
    else
      @slope = (y2 - y1).to_f / (x2 - x1).to_f
    end
  end
      

  def is_obstructed?(desireddestination)

    x1 = self.x_position
    y1 = self.y_position
    x2 = desireddestination[0]
    y2 = desireddestination[1]

    line = check_line(x1, y1, x2, y2)
    #horizontal left
    if line == 'horizontal' && x1 < x2
      ((x+1)..7).each do |x_position|
        return true if occupied?
      end
    end

    #horizontal right
    if line == 'horizontal' && x1 > x2
      ((x-1)..7).each do |x_position|
        return true if occupied?
      end
    end

    #verticaldown
    if line == 'vertical' && y1 < y2
      ((y-1)..7).each do |y_position|
        return true if occupied?
      end
    end

    #verticalup
    if line == 'vertical' && y1 > y2
      ((y+1)..7).each do |y_position|
        return true if occupied?
      end
    end
    if line == 'horizontal' || line == 'vertical'
      return false
    end

    #diagonaldown
    if @slope.abs == 1.0 && x1 < x2
      ((x-1)..7}.each do |x_position|
        delta_y = x - x1
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x_position, y_position)
      end
    end

    #diagonalup
    if @slope.abs == 1.0 && x1 > x2
      ((x+1)..7).each do |x_position|
        delta_y = x1 - x
        y = y2 > y1 ? y1 + delta_y : y1 - delta_y
        return true if occupied?(x_position, y_position)
      end
    end

    #not a straight line
    if @slope.abs != 1.0
      fail 'path is not a straight line'
    else return false
    end
  end
end