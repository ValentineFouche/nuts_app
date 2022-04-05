class RecommendationsController < ApplicationController
  def index
    @recommendations = Recommendation.all
  end

  def new
    @list = List.find(params[:list_id])
    @recommendation = Recommendation.new
  end

  def create
    @list = List.find(params[:list_id])
    @recommendation = Recommendation.new(params_recommendations)
    @recommendation.list = @list
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
  end

  def searched
    @recomendations = Recommendation.where(searched: true)
  end

  private

  def params_recommendations
    params.require(:recommendation).permit(:friend, :added_on, :comment, :searched, :viewed,
                                           :feedback_content, :feedback, :rating)
  end
end
