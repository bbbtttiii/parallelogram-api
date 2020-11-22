Rails.application.routes.draw do
  resources :favorites
  namespace :api do
    namespace :v1 do
      resources :users
      resources :articles
    end
  end
end
