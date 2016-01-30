class AddToRatingsAvgOppRating < ActiveRecord::Migration
  def change
    add_column :ratings, :avg_opp_rating_win, :integer
    add_column :ratings, :avg_opp_rating_loss, :integer
  end
end
