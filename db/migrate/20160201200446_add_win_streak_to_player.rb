class AddWinStreakToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :win_streak, :integer
  end
end
