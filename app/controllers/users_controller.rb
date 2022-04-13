class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    user_recommendations = Recommendation.where(user_id: current_user.id)
    @user_friend = user_recommendations.map{ |reco|reco.friend }
    @user_friends = @user_friend.uniq
    # @friends = all_friends.uniq.reject! { |friend| User.where(nickname: friend).first == current_user }
    @movies = current_user.recommendations.map {|reco| reco.movie}
  end
end
