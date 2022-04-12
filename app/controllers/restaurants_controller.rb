class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude,
        info_window: render_to_string(partial: "info_window", locals: { restaurant: restaurant })
      }
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(params_restaurants)
    if @restaurant.save
      redirect_to new_restaurantrecom_path
    else
      render :new
    end
  end

  private

  def params_restaurants
    params.require(:restaurant).permit(:title, :address)
  end
end
