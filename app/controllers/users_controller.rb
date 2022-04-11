class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @friends = Recommendation.all.map{|reco|reco.friend}
  end
end
