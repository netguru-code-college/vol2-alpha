Rails.application.routes.draw do


  get 'opinions/create'

  root "users#index"

  post "/", to: "users#search"
  get "/:locale", to: "users#index"

  devise_for :users


  scope '(:locale)', locale: /en|pl/ do
    resources :users do
      resources :profile, controller: "users/profile"
      resources :opinions
    end
    resources :meetups
    get "/about", to: "pages#about"
  end
end
