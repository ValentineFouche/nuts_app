class RecommendationsController < ApplicationController
  def index
    reco_not_sorted = Recommendation.where(user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @recommendations = reco_sorted_asc.reverse
  end

  def new
    @recommendation = Recommendation.new
    all_movies = Movie.all

    if params[:query].present? == false
      @movies = []
    else
      @movies = all_movies.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'recommendations/movie_list', locals: { movies: @movies }, formats: [:html] }
    end
  end

  def create
    @recommendation = Recommendation.new(params_recommendations)
    @recommendation.user = current_user
    if @recommendation.save
      redirect_to recommendation_path(@recommendation)
    else
      @movies = Movie.where(id: @recommendation.movie_id)
      flash[:notice] = "Vous avez déja ce film dans votre liste"
      render :new
    end
  end

  def add_friend_reco
    friend_reco = Recommendation.find(params[:id])
    @recommendation = Recommendation.new
    @recommendation.user = current_user
    @recommendation.movie = friend_reco.movie
    @recommendation.friend = User.find(friend_reco.user_id).nickname
    if @recommendation.save
      redirect_to recommendations_path
    else
      render :new
    end
  end

  def show
    @recommendation = Recommendation.find(params[:id])
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    @recommendation.update(params_recommendations)
    redirect_to recommendation_path(@recommendation)
  end

  def searched
    reco_not_sorted = Recommendation.where(searched: true, user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @recommendations = reco_sorted_asc.reverse
  end

  def viewed
    reco_not_sorted = Recommendation.where(viewed: true, user_id: current_user.id )
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @recommendations = reco_sorted_asc.reverse
  end

  def to_view
    reco_not_sorted = Recommendation.where(viewed: false, user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @recommendations = reco_sorted_asc.reverse
  end

  def movies_search
    @recommendation = Recommendation.find(params[:recommendation_id])
    @recommendation.searched = true
    @recommendation.save
    moviename = @recommendation.movie.title.gsub(' ','+')
    redirect_to("https://www.google.fr/search?q=regarder+#{moviename}")
  end

  private

  def params_recommendations
    params.require(:recommendation).permit(:friend, :comment, :searched, :viewed,
                                           :feedback_content, :feedback_rating, :movie_id, :user_id)
  end
end
