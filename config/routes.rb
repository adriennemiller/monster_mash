Rails.application.routes.draw do
  resources :entries
  root 'monsters#home'
  resources :body_parts
  resources :monsters, except: [:edit]
  resources :beauty_contests
  resources :users, except: [:edit, :update]

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  post '/monsters/:id/like', to: 'users#like', as: 'like'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
