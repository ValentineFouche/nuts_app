class PodcastrecomsController < ApplicationController
  def index
    reco_not_sorted = Podcastrecom.all
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @podcastrecoms = reco_sorted_asc.reverse
  end

  def new
    @podcastrecom = Podcastrecom.new
    all_podcasts = Podcast.all

    if params[:query1].present? == false
      @podcasts = []
    else
      @podcasts = all_podcasts.where('title ILIKE ?', "%#{params[:query1]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'podcastrecoms/podcast_list', locals: { podcasts: @podcasts }, formats: [:html] }
    end
  end

  def create
    @podcastrecom = Podcastrecom.new(params_podcastrecoms)
    @podcastrecom.user = current_user
    if @podcastrecom.save
      redirect_to podcastrecom_path(@podcastrecom)
    else
      render :new
    end
  end

  def show
    @podcastrecom = Podcastrecom.find(params[:id])
  end

  def edit
    @podcastrecom = Podcastrecom.find(params[:id])
  end

  def update
    @podcastrecom = Podcastrecom.find(params[:id])
    @podcastrecom.update(params_podcastrecoms)
    redirect_to edit_podcastrecom_path(@podcastrecom)
  end

  def searched
    reco_not_sorted = Podcastrecom.where(searched: true)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @podcastrecoms = reco_sorted_asc.reverse
  end

  def viewed
    reco_not_sorted = Podcastrecom.where(viewed: true)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @podcastrecoms = reco_sorted_asc.reverse
  end

  def podcasts_search
    @podcastrecom = Podcastrecom.find(params[:podcastrecom_id])
    @podcastrecom.searched = true
    @podcastrecom.save
    podcastname = @podcastrecom.podcast.title.gsub(' ','+')
    redirect_to("https://www.google.fr/search?q=ecouter+des+podcasts+#{podcastname}")
  end

  private

  def params_podcastrecoms
    params.require(:podcastrecom).permit(:friend, :comment, :searched, :viewed,
                                         :feedback_content, :feedback_rating, :podcast_id, :user_id)
  end
end
