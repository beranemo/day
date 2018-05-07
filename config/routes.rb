Rails.application.routes.draw do
  devise_for :users
  root 'restaurants#index'
  
  namespace :admin do
    root 'restaurants#index'
    resources :restaurants
    resources :categories
  end
  
  resources :restaurants, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
      
    collection do
      get :newsfeed # 瀏覽所有餐廳的最新動態
      get :ranking # TOP 10
    end
    
    member do
      get :dashboard # 瀏覽個別餐廳的 Dashboard
      post :favorite
      post :unfavorite
    end

  end
  
  resources :categories, only: :show
  
  resources :users, only: [:index, :show, :edit, :update]
  
  resources :followships, only: [:create, :destroy]
  
end
