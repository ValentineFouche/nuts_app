class AddPodcastIdToPoscastrecomModel < ActiveRecord::Migration[6.1]
  def change
    add_column :podcastrecoms, :podcast, :integer
  end
end
