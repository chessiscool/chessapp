# frozen_string_literal: true

# PiecesHelper module is connected to PagesController to extract complexity
module PiecesHelper

  # @game = Game.find_by(id: params[:id])
  # @piece = @game.pieces.where(x_position: x_coord, y_position: y_coord)
  
  # def render_piece_id
  #   piece_image = @piece.pluck(:piece_type).first
  #   image_tag('pieces/' + piece_image + '.png', class: 'piece')
  # end

  # finds squares that have pieces in them
  def selected(x_coord, y_coord)
    @piece = @game.piece.where(x_position: x_coord, y_position: y_coord)
    @game = piece.game
    update(x_coord, y_coord)
    @piece.present?
  end

  # displays pieces
  def render_piece_id
    piece_image = @piece.pluck(:piece_type).first
    image_tag('pieces/' + piece_image + '.png', class: 'piece') 
  end

  # updates the piece's x and y coordinates 
  def update (x_position, y_position)
    @piece = @piece.find(piece_id: params[:piece_id]).update_attributes(x_position:x_position, y_position:y_position)
    # redirect_to game_path(@game)
  end

end
