Rails.application.routes.draw do
  root 'monsters#home'
  resources :body_parts
  resources :monsters
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
