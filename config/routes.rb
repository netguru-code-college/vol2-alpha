Rails.application.routes.draw do
  root "users#index"

  post "/", to: "users#search"
  get "/:locale", to: "users#index"

  devise_for :users
  #devise_for :users, :controllers => { registrations: 'registrations' }
  scope "/:locale" do
  # devise_for :users, :controllers => { registrations: 'registrations' }
    resources :users do
      resources :profile, controller: "users/profile"
    end
    get "/about", to: "pages#about"
  end
end
