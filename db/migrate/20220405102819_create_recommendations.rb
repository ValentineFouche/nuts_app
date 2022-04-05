class CreateRecommendations < ActiveRecord::Migration[6.1]
  def change
    create_table :recommendations do |t|
      t.string :friend
      t.time :added_on
      t.text :comment
      t.boolean :searched
      t.boolean :viewed
      t.text :feedback_content
      t.integer :feedback_rating
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.references :restaurant, null: false, foreign_key: true
      t.references :podcast, null: false, foreign_key: true
      t.references :book, null: false, foreign_key: true

      t.timestamps
    end
  end
end
