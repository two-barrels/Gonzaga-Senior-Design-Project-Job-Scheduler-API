Rails.application.routes.draw do
  resources :users
  resources :posts
  get '/test', to: 'test#index'
  get '/users', to: 'users#index'
end
