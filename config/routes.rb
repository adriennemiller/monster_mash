Rails.application.routes.draw do
  resources :entries
  resources :beauty_contests
  root 'monsters#home'
  resources :body_parts
  resources :monsters
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/monsters/:id/like', to: 'users#like', as: 'like'
  get '/contests/new', to: 'beauty_contests#new'
  post '/contests/create', to: 'beauty_contests#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
