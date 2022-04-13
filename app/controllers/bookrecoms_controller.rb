class BookrecomsController < ApplicationController
  def index
    reco_not_sorted = Bookrecom.where(user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.created_at }
    @bookrecoms = reco_sorted_asc.reverse
  end

  def new
    @bookrecom = Bookrecom.new
    all_books = Book.all

    if params[:query].present? == false
      @books = []
    else
      @books = all_books.where('title ILIKE ?', "%#{params[:query]}%")
    end

    respond_to do |format|
      format.html # Follow regular flow of Rails
      format.text { render partial: 'bookrecoms/book_list', locals: { books: @books }, formats: [:html] }
    end
  end

  def create
    @bookrecom = Bookrecom.new(params_bookrecoms)
    @bookrecom.user = current_user
    if @bookrecom.save
      redirect_to bookrecom_path(@bookrecom)
    else
      render :new
    end
  end

  def add_friend_book_reco
    friend_reco = Bookrecom.find(params[:id])
    @recommendation = Bookrecom.new
    @recommendation.user = current_user
    @recommendation.book = friend_reco.book
    friend_nickname = User.find(friend_reco.user_id).nickname
    @recommendation.comment = "Trouvé sur la liste de #{friend_nickname} avec ce commentaire : #{friend_reco.comment}"
    @recommendation.friend = friend_nickname
    if @recommendation.save
      redirect_to bookrecoms_path
    else
      render :new
    end
  end

  def show
    @bookrecom = Bookrecom.find(params[:id])
  end

  def edit
    @bookrecom = Bookrecom.find(params[:id])
  end

  def update
    @bookrecom = Bookrecom.find(params[:id])
    @bookrecom.update(params_bookrecoms)
    redirect_to bookrecom_path(@bookrecom)
  end

  def searched
    reco_not_sorted = Bookrecom.where(searched: true, user_id: current_user.id)
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @bookrecoms = reco_sorted_asc.reverse
  end

  def viewed
    reco_not_sorted = Bookrecom.where(viewed: true, user_id: current_user.id )
    reco_sorted_asc = reco_not_sorted.sort_by {|reco| reco.updated_at }
    @bookrecoms = reco_sorted_asc.reverse
  end

  def books_search
    @bookrecom = Bookrecom.find(params[:bookrecom_id])
    @bookrecom.searched = true
    @bookrecom.save
    bookname = @bookrecom.book.title.gsub(' ','+')
    redirect_to("https://www.google.fr/search?q=lire+#{bookname}")
  end

  private

  def params_bookrecoms
    params.require(:bookrecom).permit(:friend, :comment, :searched, :viewed,
                                      :feedback_content, :feedback_rating, :book_id, :user_id)
  end
end
