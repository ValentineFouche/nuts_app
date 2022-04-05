class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def new
    @recommendation = Recommendation.new

  end

  def create
    @recommendation = Recommendation.new(params_recommendations)
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
  end

  def searched
    @recommendations = Recommendation.where(searched: true)
  end

  private

  def params_recommendations
    params.require(:recommendation).permit(:friend, :added_on, :comment, :searched, :viewed,
                                           :feedback_content, :feedback, :rating, :movie_id, :user_id)
  end
end
