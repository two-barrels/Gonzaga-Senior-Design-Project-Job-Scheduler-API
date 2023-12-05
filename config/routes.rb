# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users,
             controllers: {
               sessions: 'users/sessions',
               registrations: 'users/registrations'
             }
  get '/member-data', to: 'members#show'
  resources :users
  resources :posts
  get '/test', to: 'test#index'
  get '/users', to: 'users#index'
  get '/spaces', to: 'spaces#index'
  get '/floors',  to: 'floors#index'
  get '/spaces/get_floors', to: 'spaces#show'
  get '/reservations', to: 'reservations#index'
end
