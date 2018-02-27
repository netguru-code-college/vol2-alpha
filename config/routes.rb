Rails.application.routes.draw do
  root "users#index"

  post "/", to: "users#search"
  get "/:locale", to: "users#index"

  devise_for :users


  scope "/:locale" do
    get "/about", to: "pages#about"
    resources :users
  end
end
