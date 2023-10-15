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
end
