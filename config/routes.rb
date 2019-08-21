<<<<<<< HEAD
# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'games#index'
  resources :games
=======
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
>>>>>>> 762ea5f5c6f95f9adf39127e991b29cee37821c7
end
