Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :posts
  get '/test', to: 'test#index'
  get '/users', to: 'users#index'
end
