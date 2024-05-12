Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :players do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    resources :ranks, only: [:create]
  end

  resources :comments do
    resources :favorites, only: [:create, :destroy]
  end

  root 'players#index'
  get 'statics/top' => 'statics#top'

  patch 'players/:id' => 'players#update'
  delete 'players/:id' => 'players#destroy'
  get 'players/:id/edit' => 'players#edit', as:'edit_tweet'

  resources :requests

  get "search" => "searches#search"
end