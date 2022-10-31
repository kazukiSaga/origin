Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :followings, on: :member
    get :followers, on: :member
  end 
  resources :films do
    resource :favorites, only: [:create, :destroy]
  end
  get "favorite_posts" => "favorites#favorite_posts"
  resources :genres
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
