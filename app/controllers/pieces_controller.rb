# frozen_string_literal: true

# Piece controller enable the CRUD method
class PiecesController < ApplicationController
  def new
    @piece = Piece.new
  end

  def create
    @piece = Piece.create
  end

  def show; end
end
