class AddVideoLinkToGames < ActiveRecord::Migration
  def change
    add_column :games, :video_link, :string
  end
end
