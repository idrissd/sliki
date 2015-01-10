Rails.application.routes.draw do
  resources :kinds

  resources :things

  resources :pages

  resources :topics

  resources :groups

  root to: 'visitors#index'
  devise_for :users
  resources :users
end
