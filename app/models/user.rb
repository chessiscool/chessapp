# frozen_string_literal: true

# User class is defining the model associated with UsersController
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: [:facebook]
  has_many :games, dependent: :destroy

  def self.new_with_session(params, session)
    super.tap do |user|
      if data == session['devise.facebook_data'] && session['devise.facebook_data']['extra']['raw_info'] # rubocop:disable LineLength
        user.email = data['email'] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
    end
  end
end
