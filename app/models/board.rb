class Board

  def available_moves x, y
    horizontal_left x, y
    horizontal_right x, y
    vert_up x, y
    vert_down x, y
    diagonal x, y
  end

  def horizontal_left x, y
    ((x-1)..7).each do |x_pos|

  end

  def horizontal_right x, y

  end

  def vert_up x, y

  end

  def vert_down x, y

  end

  def diagonal x, y


#  def diagonal_check(desireddestination, currentlocation, otherpieceslocation, piecetype)
#    puts
#  end

#  def determine_piece_type_and_run_function(piecetype)
#    if(piecetype=="knight")
#      horizontal_check(1,2,3,4)
#    elsif (piecetype=="king")
#      vert_check(1,2,3,4)
#    end
#  end

  def is_obstructed?

  end

#  determine_piece_type_and_run_function("king")

end