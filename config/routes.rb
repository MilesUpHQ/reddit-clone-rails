Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  #The database queries or associations are being executed during the application's boot process,
  #before the database connection has been established, so rescue is used.
  ActiveAdmin.routes(self) rescue ActiveAdmin::DatabaseHitDuringLoad
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile
  get "/saved_posts" => "save_post#saved_posts"
  resources :communities, path: :r do
    resources :posts, path: :p, except: [:new] do
      member do
        patch :close
        get :report
      end
    end
  end

  get "/submit", to: "posts#new", as: "new_community_post"


  post 'save_post/:id', to: "save_post#create", as: "save_post_path"

  resources :report_reasons
  resources :banned_users
  resources :subscriptions
  resources :comments, only: [:create]
  resources :reports, only: [:create]

  post "p/vote" => "votes#create"

  get 'r/:id/mod' , to: 'communities#mod' , as: 'mod'

  match "/404", to: "errors#not_found",via: :all 
  get :autocomplete, to: 'communities#autocomplete'
  root to: 'public#index'
end
