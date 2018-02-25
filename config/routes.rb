Rails.application.routes.draw do
  root "users#index"

  post "/", to: "users#search"
  get "/:locale", to: "users#index"

  devise_for :users

  scope "/:locale" do
    resources :users
  end
end
