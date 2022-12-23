Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile
  get "/saved_posts" => "posts#saved_posts"
  resources :communities do
    resources :posts do
      member do
        patch :save 
        patch :unsave
      end
    end
  end

  resources :subscriptions
  resources :comments, only: [:create]

  post "post/vote" => "votes#create"

  # devise_scope :account do
  #   get '/sign_in' => 'devise/sessions#new' # custom path to login/sign_in
  #   get '/sign_up' => 'devise/registrations#new', as: 'new_account_registration' # custom path to sign_up/registration
  # end
  root to: 'public#index'
end
