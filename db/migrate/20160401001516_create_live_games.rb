class CreateLiveGames < ActiveRecord::Migration
  def change
    create_table :live_games do |t|
      t.string :player_one_slack
      t.string :player_two_slack
      t.integer :player_one_score
      t.integer :player_two_score

      t.timestamps null: false
    end
  end
end
