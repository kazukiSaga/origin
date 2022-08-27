Rails.application.routes.draw do
  get 'films/index'
  get 'films/show'
  get 'films/new'
  get 'films/edit'
  devise_for :users
  root to: "home#index"
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
