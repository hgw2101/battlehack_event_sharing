Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :rides
  root to: 'pages#index'

  match '/login', to:'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'

end
