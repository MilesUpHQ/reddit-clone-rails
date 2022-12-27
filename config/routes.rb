Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile
  get "/saved_posts" => "posts#saved_posts"
  resources :communities do
    resources :posts do
      member do
        patch :close
      end
    end
    resources :posts do
      member do
        patch :save 
        patch :unsave
      end
    end
    resources :posts do
      member do
        get :report
      end
    end
  end
  resources :report_reasons
  resources :subscriptions
  resources :comments, only: [:create]
  resources :reports, only: [:create]
  post "post/vote" => "votes#create"
  get '/draft', to: 'posts#draft'
  # devise_scope :account do
  #   get '/sign_in' => 'devise/sessions#new' # custom path to login/sign_in
  #   get '/sign_up' => 'devise/registrations#new', as: 'new_account_registration' # custom path to sign_up/registration
  # end
  root to: 'public#index'
end
