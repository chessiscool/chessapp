# frozen_string_literal: true

# Game controller enable the CRUD method
class GamesController < ApplicationController
  def index
    @game = Game.new
  end

  def new
    @game = Game.new
  end

  def create
    Game.create(game_params)
    redirect_to root_path
  end

  def show
  end

  private

  def game_params
    params.require(:game).permit(:name, :black_player_id, :white_player_id,)
  end
end
