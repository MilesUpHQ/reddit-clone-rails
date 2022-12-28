Rails.application.routes.draw do
  
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :accounts
  get "u/:username" => "public#profile", as: :profile

  resources :communities do
    resources :posts
  end

  resources :banned_users
  resources :subscriptions
  resources :comments, only: [:create]

  post "post/vote" => "votes#create"
  get '/draft', to: 'posts#draft'
  get '/communities/:id/mod' , to: 'communities#mod' , as: 'mod' 
  
  match '*path', to: 'errors#not_found', via: :all
  get :autocomplete, to: 'communities#autocomplete'
  root to: 'public#index'  
end
