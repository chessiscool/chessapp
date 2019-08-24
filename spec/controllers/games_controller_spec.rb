# frozen_string_literal: true

# This is where we can add tests for the games controller

require 'rails_helper'

RSpec.describe GamesController, type: :controller do
  describe 'games#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
