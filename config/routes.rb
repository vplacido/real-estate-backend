Rails.application.routes.draw do
  resources :bookings
  resources :tests
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, :cities, :likes, :listings, :reviews, :towns, :visits, :tests

  # for jwt authorization
  post "/login", to: "auth#login"
  get "/auto_login", to: "auth#auto_login"
  get "/user_is_authed", to: "auth#user_is_authed"
end
