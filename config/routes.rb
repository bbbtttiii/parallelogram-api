Rails.application.routes.draw do
  get '/api/v1/login', to: 'auth#create'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :articles
      resources :favorites
    end
  end
end
