class AddArrayToQueues < ActiveRecord::Migration
  def change
    add_column :player_queues, :player_id, :integer, array: true, default: []
  end
end
