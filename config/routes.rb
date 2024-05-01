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
  resources :floors
  resources :buildings
  resources :roles
  get '/users', to: 'users#show'
  get '/spaces', to: 'spaces#index'
  get '/spaces/get_floor/:floor_id', to: 'spaces#get_space_geo_by_floor'
  get '/floors/get_floors', to: 'floors#show'
  get '/spaces/get_floors', to: 'spaces#show'
  get '/buildings', to: 'buildings#index'
  get '/buildings/:building_id/floors', to: 'floors#building_floors'
  post 'assignments/change_admin_status', to: 'assignments#change_admin_status'
  post 'floors/by_building', to: 'floors#by_building'
  post 'spaces/by_floor', to: 'spaces#by_floor'
  get '/reservations/space/:space_id', to: 'reservations#get_reservation_by_space'
  put '/reservations', to: 'reservations#update'
  get '/dashboard', to: 'reservations#get_reservation_by_user'
  post 'buildings/buildings_by_ids', to: 'buildings#buildings_by_ids'
  post 'floors/floors_by_ids', to: 'floors#floors_by_ids'
  post '/spaces/spaces_by_ids', to: 'spaces#spaces_by_ids'
  get '/assignments/assignments_by_user', to: 'assignments#assignments_by_user'
end
