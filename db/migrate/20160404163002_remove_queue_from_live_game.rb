class RemoveQueueFromLiveGame < ActiveRecord::Migration
  def change
    remove_column :live_games, :queue
  end
end
