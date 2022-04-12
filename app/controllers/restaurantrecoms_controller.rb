class RestaurantrecomsController < ApplicationController
  def index
    reco_not_sorted = Restaurantrecom.all
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @restaurantrecoms = reco_sorted_asc.reverse
  end

  def new
    @restaurantrecom = Restaurantrecom.new
    all_restaurants = Restaurant.all

    if params[:query].present? == false
      @restaurants = []
    else
      @restaurants = all_restaurants.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'restaurant_list', locals: { restaurants: @restaurants }, formats: [:html] }
    end
  end

  def create
    @restaurantrecom = Restaurantrecom.new(params_restaurantrecoms)
    @restaurantrecom.user = current_user
    if @restaurantrecom.save
      redirect_to restaurantrecom_path(@restaurantrecom)
    else
      render :new
    end
  end

  def show
    @restaurantrecom = Restaurantrecom.find(params[:id])
  end

  def edit
    @restaurantrecom = Restaurantrecom.find(params[:id])
  end

  def update
    @restaurantrecom = Restaurantrecom.find(params[:id])
    @restaurantrecom.update(params_restaurantrecoms)
    redirect_to edit_restaurantrecom_path(@restaurantrecom)
  end

  def searched
    reco_not_sorted = Restaurantrecom.where(searched: true)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @restaurantrecoms = reco_sorted_asc.reverse
  end

  def viewed
    reco_not_sorted = Restaurantrecom.where(viewed: true)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @restaurantrecoms = reco_sorted_asc.reverse
  end

  def restaurants_search
    @restaurantrecom = Restaurantrecom.find(params[:restaurantrecom_id])
    @restaurantrecom.searched = true
    @restaurantrecom.save
    restaurantname = @restaurantrecom.restaurant.title.gsub(' ','+')
    redirect_to("https://www.google.fr/search?q=restaurants+#{restaurantname}")
  end

  private

  def params_restaurantrecoms
    params.require(:restaurantrecom).permit(:friend, :comment, :searched, :viewed,
                                            :feedback_content, :feedback_rating, :restaurant_id, :user_id)
  end
end
