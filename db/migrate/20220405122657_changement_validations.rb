class ChangementValidations < ActiveRecord::Migration[6.1]
  def change
    change_column_null :recommendations, :movie_id, true
    change_column_null :recommendations, :book_id, true
    change_column_null :recommendations, :podcast_id, true
    change_column_null :recommendations, :restaurant_id, true
  end
end
