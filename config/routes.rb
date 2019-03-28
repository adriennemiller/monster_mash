Rails.application.routes.draw do
  root 'monsters#home'
  resources :body_parts
  resources :monsters
  resources :users

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/monsters/:id/like', to 'users#like'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
