Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/feed', to: 'pages#feed', as: 'feed'
  get '/profile/:id', to: 'pages#profile', as: 'profile'
  get '/dashboard', to: 'pages#dashboard'
  post '/profile/:id', to: 'pages#follow', as: 'new_follow'
  get '/allfavorites', to: 'pages#favorites', as: 'allfavs'
  get '/allcars', to: 'pages#cars', as: 'allcars'
  resources :cars do
    resources :bookings, only: [:create]
    resources :favorites, only: [:new, :create]
  end
  resources :relationships, only: [:destroy]
  resources :favorites, only: [:destroy]
  resources :bookings, only: [:edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
