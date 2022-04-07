class CreatePodcastrecoms < ActiveRecord::Migration[6.1]
  def change
    create_table :podcastrecoms do |t|
      t.string :friend
      t.text :comment
      t.boolean :searched
      t.boolean :viewed
      t.text :feedback_content
      t.integer :feedback_rating
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
