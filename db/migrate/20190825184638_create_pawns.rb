# frozen_string_literal: true

# This is the first step in setting up the STI on the pieces.
# This affects the class "Pawn" which is a child of "Piece".
class CreatePawns < ActiveRecord::Migration[5.2]
  def change
    create_table :pawns, &:timestamps
  end
end