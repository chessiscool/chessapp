# frozen_string_literal: true

# AddTypeToPieces class is to add data to the
# already created :pieces database table
class AddTypeToPieces < ActiveRecord::Migration[5.2]
  def change
    add_column :pieces, :type, :string
  end
end
