Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :accounts
      resources :communities do
        resources :posts
      end
      get 'search_suggestions', to: 'communities#search_suggestions'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
