class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.page(params[:page]).per(9)
    @categories = Category.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @comment = Comment.new
  end
  
  def newsfeed
    @recent_restaurants = Restaurant.order(created_at: :desc).limit(10)
    @recent_comments = Comment.order(created_at: :desc).limit(10)
  end
  
  def dashboard
    @restaurant = Restaurant.find(params[:id])
  end
  
  def ranking
    @restaurants = Restaurant.order(favorites_count: :desc).limit(10)
  end
  
  def favorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    if favorites.exists?
      flash[:alert] = "已被收藏"
    else
      @restaurant.favorites.create!(user: current_user)
    end
    redirect_back(fallback_location: root_path)  # 導回上一頁
  end

  def unfavorite
    @restaurant = Restaurant.find(params[:id])
    favorites = Favorite.where(restaurant: @restaurant, user: current_user)
    favorites.destroy_all
    redirect_back(fallback_location: root_path)
  end

end
