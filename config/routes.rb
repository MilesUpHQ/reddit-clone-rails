Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      devise_for :accounts
      resources :users do
        resources :save_posts
      end
      resources :communities do
        get 'accounts_search', to: 'communities#joined_account_community'
        resources :banned_users
        resources :subscriptions
        resources :posts do
          patch :close
          resources :votes
          resources :comments
          resources :reports
        end
      end
      get 'search_suggestions', to: 'communities#search_suggestions'
      get 'navbar_search', to: 'posts#navbar_search'
      get 'subscribers', to: 'subscriptions#subscribers_list'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
