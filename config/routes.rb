Rails.application.routes.draw do
  resources :sessions, only: [:create]
  resources :registrations, only: [:create]

  # Custom routes for sessions
  delete :logout, to: "sessions#logout"
  get :logged_in, to: "sessions#logged_in"
  patch '/sessions/update', to: 'sessions#update'
  root to: "static#home"
end
