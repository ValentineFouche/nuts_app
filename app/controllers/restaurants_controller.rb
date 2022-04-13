class RestaurantsController < ApplicationController
  def index
    reco_not_sorted = Restaurant.where(user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @restaurants = reco_sorted_asc.reverse
    @markers = Restaurant.where(user_id: current_user.id).geocoded.map do |restaurant|
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
    @user = current_user
    @restaurant = Restaurant.new(params_restaurants)
    @restaurant.user = @user
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    @restaurant.update(params_restaurants)
    redirect_to restaurant_path(@restaurant)
  end

  def searched
    reco_not_sorted = Restaurant.where(searched: true, user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @restaurants = reco_sorted_asc.reverse
  end

  def viewed
    reco_not_sorted = Restaurant.where(viewed: true, user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @restaurants = reco_sorted_asc.reverse
  end

  def add_friend_reco
    friend_reco = Restaurant.find(params[:id])
    @restaurant = Restaurant.new
    @restaurant.user = current_user
    @restaurant.title = friend_reco.title
    @restaurant.latitude = friend_reco.latitude
    @restaurant.longitude = friend_reco.longitude
    @restaurant.address = friend_reco.address
    friend_nickname = User.find(friend_reco.user_id).nickname
    @restaurant.comment = "Trouvé sur la liste de #{friend_nickname} avec ce commentaire : #{friend_reco.comment}"
    @restaurant.friend = friend_nickname
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  private

  def params_restaurants
    params.require(:restaurant).permit(:title, :address, :friend, :comment, :latitude, :longitude, :searched, :viewed,
                                       :feedback_content, :feedback_rating, :user_id)
  end
end
