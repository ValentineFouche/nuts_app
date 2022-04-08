class CorrectPodcastId < ActiveRecord::Migration[6.1]
  def change
    rename_column :podcastrecoms, :podcast, :podcast_id
  end
end
