Rails.application.routes.draw do
  root "users#index"
  resources :users
  post "/", to: "users#search"
  devise_for :users
end
