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

  private

  def piece_params
    params.require(:piece).permit(:game_id,
                                  :user_id,
                                  :type,
                                  :x_position,
                                  :y_position)
  end

  def current_game
    @current_game ||= Game.find(params[:id])
  end

  
  
end
