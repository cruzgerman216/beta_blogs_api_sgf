Rails.application.routes.draw do
  resources :blogs
  resources :users, only: [:create]
  post '/login', to: 'sessions#create'
end
