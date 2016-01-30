class AddHighestEverToRating < ActiveRecord::Migration
  def change
    add_column :ratings, :highest_ever, :integer
  end
end
