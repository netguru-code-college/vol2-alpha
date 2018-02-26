Rails.application.routes.draw do
  root "users#index"

  post "/", to: "users#search"
  get "/:locale", to: "users#index"

  devise_for :users

  get "/pages/:page", to: "pages#show"

  scope "/:locale" do
    resources :users
  end
end
