Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :accounts
      resources :communities do
        resources :subscriptions
        resources :posts do
          resources :votes, only: [:create]
          resources :comments
        end
      end
      get 'search_suggestions', to: 'communities#search_suggestions'
      get 'navbar_search', to: 'posts#navbar_search'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
