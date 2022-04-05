class Recommendation < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  # validate :movie_id_or_other

  # def movie_id_or_other
  #   if movie_id.nil? && book_id.nil? && podcast_id.nil? && restaurant_id.nil?
  #     errors.add('renseignez au moins un film, un livre, un restau ou un podcast!')
  #   end
  # end
end
