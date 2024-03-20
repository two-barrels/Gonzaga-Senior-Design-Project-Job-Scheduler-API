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
  resources :reservations
  resources :spaces
  resources :assignments
  get '/users', to: 'users#show'
  get '/spaces', to: 'spaces#index'
  get '/spaces/get_floor/:floor_id', to: 'spaces#get_space_geo_by_floor'
  get '/floors', to: 'floors#index'
  get '/spaces/get_floors', to: 'spaces#show'
  get '/buildings', to: 'buildings#index'
  post 'assignments/change_admin_status', to: 'assignments#change_admin_status'
  get '/reservations/space/:space_id', to: 'reservations#get_reservation_by_space'
  put '/reservations', to: 'reservations#update'
end
