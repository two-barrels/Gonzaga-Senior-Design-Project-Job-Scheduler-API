Rails.application.routes.draw do
  resources :posts
  get '/test', to: 'test#index'
end
