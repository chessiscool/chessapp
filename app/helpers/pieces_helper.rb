# frozen_string_literal: true

# PiecesHelper module is connected to PagesController to extract complexity
module PiecesHelper

  # @game = Game.find_by(id: params[:id])
  # @piece = @game.pieces.where(x_position: x_coord, y_position: y_coord)
  
  # def render_piece_id
  #   piece_image = @piece.pluck(:piece_type).first
  #   image_tag('pieces/' + piece_image + '.png', class: 'piece')
  # end
  def selected(x_coord, y_coord)
    @game = Game.find_by(id: params[:id])
    @piece = @game.pieces.where(x_position: x_coord, y_position: y_coord)
    @piece.present?
  end

  def render_piece_id
    piece_image = @piece.pluck(:piece_type).first
    image_tag('pieces/' + piece_image + '.png', class: 'piece') 
  end

end
