Rails.application.routes.draw do
  resources :users
  resources :posts
  get '/test', to: 'test#index'
  get '/users', to: 'users#index'
  get '/spaces', to: 'spaces#index'
  get '/floors',  to: 'floors#index'
  get '/spaces/get_floors', to: 'spaces#show'
end
