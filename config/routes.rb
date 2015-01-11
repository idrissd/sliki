require 'sidekiq/web'
Rails.application.routes.draw do
  # devise_for :users, :controllers => { :sessions => "sessions" }
  devise_for :users
  resources :users, :only => [:show, :index]
  resources :versions, :only => [:show, :update]
  resources :events, :only => [:update]
  resources :groups
  resources :topics do
    resources :pages
    resources :things do
      collection { post :position }
      resources :kinds
    end
  end
  root :to => "topics#index"
  mount Sidekiq::Web, at: '/sidekiq'
end
