Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:show, :new, :create]

  resources :albums
  resources :tracks
  resources :likes, only: [:create, :destroy]
end
