# frozen_string_literal: true

# User class is created in association with Devise
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
<<<<<<< HEAD
=======

  has_many :games, dependent: :destroy
>>>>>>> 3e61dbe26a8e71d1481872f13e7fc6702703ee41
end
