Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :rides
  root to: 'pages#index'

  match '/login', to:'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'
  post '/users/user_rides/:id/rider_approve', to: 'user_rides#rider_approve', as: 'rider_approve'

end
