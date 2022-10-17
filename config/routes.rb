Rails.application.routes.draw do

  resources :channels
  resources :discussions do
    resources :replies
  end
  resources :votes
  # post "discussion/vote" => "votes#create"

  root 'discussions#index'



  devise_for :users, controllers: { registrations: 'registrations'}
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    # get 'discussion/like/:discussion_id' => 'likes#save_like', as: :like_discussion
    # post 'discussion/vote' => 'votes#create'

  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
