Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :accounts
      resources :communities
      resources :posts do
        resources :comments, only: [:create]
      end
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
