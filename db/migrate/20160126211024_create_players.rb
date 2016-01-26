class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.integer :games_played
      t.integer :wins
      t.integer :losses
      t.integer :rating

      t.timestamps null: false
    end
  end
end
