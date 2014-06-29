Rails.application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :rides
  root to: 'pages#index'

  match '/login', to:'sessions#new', via: 'get'
  match '/logout', to: 'sessions#destroy', via: 'delete'
  post '/users/user_rides/:id/rider_approve', to: 'user_rides#rider_approve', as: 'rider_approve'
  post '/rides/user_rides/:id/driver_approve', to: 'user_rides#driver_approve', as: 'driver_approve'
  post '/rides/user_rides/:ride_id', to: 'user_rides#create', as: 'user_ride_create'
  get '/rides/:id/invite_riders', to: 'rides#invite_riders', as: 'invite_riders'
  post '/rides/user_rides/:id/payment', to: 'user_rides#payment', as: 'payment'

end
