# frozen_string_literal: true

# Piece controller enable the CRUD method
class PiecesController < ApplicationController
  before_action :current_game

  def create
    @pieces = current_game.pieces.create(piece_params)
  end

  def show
    @piece = Piece.all
  end

  # updates the piece's x and y coordinates 
  def update
    @game = Game.find(params[:game_id])
    @piece_id = request.path.split('/').last
    @piece = @game.pieces.find_by(id: @piece_id).update_attributes(params[:x_position].to_h)
    redirect_to game_path(current_game)
  end

  private

  def piece_params
    params.require(:piece).permit(:game_id,
                                  :user_id,
                                  :type,
                                  :x_position,
                                  :y_position)
  end

  def current_game
    @current_game ||= Game.find(params[:game_id])
  end

end
