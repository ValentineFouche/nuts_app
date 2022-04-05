class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :director
      t.string :image_url
      t.string :stream_options

      t.timestamps
    end
  end
end
