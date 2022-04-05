class RemoveColumnsFromRecommendations < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :book_id
    remove_column :recommendations, :podcast_id
    remove_column :recommendations, :restaurant_id
  end
end
