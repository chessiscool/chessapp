# frozen_string_literal: true

# Game controller enable the CRUD method
class GamesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] # rubocop:disable LineLength

  def index
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
    @game = current_user.games.create(game_params)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find_by_id(params[:id])
    @pieces = @game.pieces
  end

  def update
  end

  private

  def game_params
    params.require(:game).permit(:name, :black_player_id, :white_player_id)
  end
end
