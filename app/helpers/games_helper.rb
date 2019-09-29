# frozen_string_literal: true

# GamesHelper module is connected to GamesController to extract complexity
module GamesHelper
  def occupied?(x_coord, y_coord)
    @game = Game.find(params[:id])
    @piece = @game.pieces.where(x_position: x_coord, y_position: y_coord)
    @piece_id = @piece.pluck(:id).first
    @piece.present?
  end

  def render_piece
    piece_image = @piece.pluck(:piece_type).first
    link_to game_path, method: :put do
      image_tag('pieces/' + piece_image + '.png', class: 'piece')
    end
  end

end
