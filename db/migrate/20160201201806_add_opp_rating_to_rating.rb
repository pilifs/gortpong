class AddOppRatingToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :avg_opp_rating, :integer
  end
end
