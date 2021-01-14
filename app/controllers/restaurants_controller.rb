class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @ratings_by_restaurant = @restaurants.map do |restaurant|
      if restaurant.reviews.empty?
        []
      else
        restaurant.reviews.map { |review| review.rating }
      end
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaruant_params)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaruant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
