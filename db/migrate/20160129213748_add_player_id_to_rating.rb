class AddPlayerIdToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :player_id, :integer
  end
end
