Rails.application.routes.draw do
  resources :attendees
  resources :activities
  resources :events
  resources :users
  post "/users/login", to: "auth#login"
  get '/profile', to: 'users#profile'
  
  resources :google_api
  post "/google_api", to: "google_api#create"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
