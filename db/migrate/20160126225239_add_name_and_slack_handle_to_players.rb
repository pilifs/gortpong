class AddNameAndSlackHandleToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :slack_handle, :string
    add_column :players, :display_name, :string
  end
end
