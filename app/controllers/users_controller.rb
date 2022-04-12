class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    all_friends = Recommendation.all.map{ |reco|reco.friend }
    @friends = all_friends.uniq.reject! { |friend| User.where(nickname: friend).first == current_user }
    @movies = current_user.recommendations.map {|reco| reco.movie}
  end
end
