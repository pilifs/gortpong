class AddPlayerIdToProvisionalRating < ActiveRecord::Migration
  def change
    add_column :provisional_ratings, :player_id, :integer
  end
end
