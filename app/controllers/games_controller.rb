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

	private

	def game_params
		params.require(:game).permit(:name)
	end
end