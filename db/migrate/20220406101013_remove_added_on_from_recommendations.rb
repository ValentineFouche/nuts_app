class RemoveAddedOnFromRecommendations < ActiveRecord::Migration[6.1]
  def change
    remove_column :recommendations, :added_on
  end
end
