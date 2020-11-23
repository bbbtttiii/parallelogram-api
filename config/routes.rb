Rails.application.routes.draw do
  get "/api/v1/login", to: "auth#create"
  get "/api/v1/get_current_user", to: "auth#get_current_user"
  namespace :api do
    namespace :v1 do
      resources :users
      resources :articles
      resources :favorites
    end
  end
end
