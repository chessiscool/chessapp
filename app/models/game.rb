<<<<<<< HEAD
class Game < ApplicationRecord
=======
# frozen_string_literal: true

# Game class is defining the model associated with GamesController
class Game < ApplicationRecord
  has_many :pieces, dependent: :destroy
>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
end
