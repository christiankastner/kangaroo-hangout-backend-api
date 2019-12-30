Rails.application.routes.draw do
  resources :attendees
  resources :activities
  resources :events
  resources :users
  resources :google_api
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
