Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile
  get "/saved_posts" => "posts#saved_posts"

  resources :communities, path: :r
  resources :posts, path: :p do
    member do
      patch :save
      patch :unsave
      patch :close
      get :report
    end
  end
  resources :report_reasons
  resources :banned_users
  resources :subscriptions
  resources :comments, only: [:create]

  resources :reports, only: [:create]
  post "p/vote" => "votes#create"
  get '/draft', to: 'posts#draft'
  get '/communities/:id/mod' , to: 'communities#mod' , as: 'mod' 
  
  match '*path', to: 'errors#not_found', via: :all
  get :autocomplete, to: 'communities#autocomplete'
  root to: 'public#index'  
end
