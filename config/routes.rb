Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  
  namespace :admin do
    root 'restaurants#index'
    resources :restaurants
    resources :categories
  end
  
  resources :restaurants, only: [:index, :show]
  resources :categories, only: :show
  
end
