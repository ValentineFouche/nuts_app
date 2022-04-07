class RecommendationsController < ApplicationController
  def index
    reco_not_sorted = Recommendation.all
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @recommendations = reco_sorted_asc.reverse
  end

  def new
    @recommendation = Recommendation.new
    @movies = Movie.all

    if params[:query].present?
      @movies = @movies.where('title ILIKE ?', "%#{params[:query]}%")
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
    redirect_to edit_recommendation_path(@recommendation)
  end

  def searched
    reco_not_sorted = Recommendation.where(searched: true)
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
    params.require(:recommendation).permit(:friend, :added_on, :comment, :searched, :viewed,
                                           :feedback_content, :feedback, :rating, :movie_id, :user_id)
  end
end
