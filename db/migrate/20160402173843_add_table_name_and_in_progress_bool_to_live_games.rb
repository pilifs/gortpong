class AddTableNameAndInProgressBoolToLiveGames < ActiveRecord::Migration
  def change
    add_column :live_games, :table_name, :string
    add_column :live_games, :in_progress, :boolean
  end
end
