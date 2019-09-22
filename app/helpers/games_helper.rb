# frozen_string_literal: true

# GamesHelper module is connected to GamesController to extract complexity
module GamesHelper
  def occupied?(x_coord, y_coord)
    @game = Game.find_by(id: params[:id])
    @piece = @game.pieces.where(x_position: x_coord, y_position: y_coord)
    @piece.present?
  end

  def render_piece
    piece_image = @piece.pluck(:piece_type).first
    image_tag('pieces/' + piece_image + '.png', class: 'piece', alt: '')
  end
end
