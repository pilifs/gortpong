class CreatePlayerQueues < ActiveRecord::Migration
  def change
    create_table :player_queues do |t|
      t.belongs_to :live_game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
