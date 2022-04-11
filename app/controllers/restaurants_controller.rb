class RestaurantsController < ApplicationController
  def index
    @user_location = Geocoder.search('109.96.240.190')
    @restaurants = Restaurant.all

    # the `geocoded` scope filters only restaurants with coordinates (latitude & longitude)
    @markers = @restaurants.geocoded.map do |restaurant|
      {
        lat: restaurant.latitude,
        lng: restaurant.longitude
      }
    end
  end
end
