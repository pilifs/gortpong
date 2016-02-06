class AddRatingChangeToGames < ActiveRecord::Migration
  def change
    add_column :games, :rating_change, :integer
  end
end
