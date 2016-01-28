class GamesReaddWinnerAndLoserIds < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.integer :winner_id
      t.integer :loser_id
    end
  end
end
