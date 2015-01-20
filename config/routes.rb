require 'sidekiq/web'
Rails.application.routes.draw do
  # devise_for :users, :controllers => { :sessions => "sessions" }
scope "/sliki" do
  devise_for :users, :controllers => { :registrations => "registrations" }
  resources :users, :only => [:show, :index, :update]
  resources :versions, :only => [:show, :update]
  resources :events, :only => [:update]
  resources :groups
  resources :topics
  resources :pages
  resources :things do
    collection { post :position }
    resources :kinds
  end
  authenticated :user do
      root :to => "users#show", :as => "authenticated_root"
  end
  root :to=>"users#index"
  mount Sidekiq::Web, at: '/sidekiq'
end
end
