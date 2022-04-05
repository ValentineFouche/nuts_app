class ChangeValidationsRecommendations < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :recommendations, column: :book_id
    remove_foreign_key :recommendations, column: :podcast_id
    remove_foreign_key :recommendations, column: :restaurant_id
  end
end
