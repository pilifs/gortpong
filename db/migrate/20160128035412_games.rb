# Should not have named this games.... oops
# Experimenting with using slack name as primary key

class Games < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.remove :winner_id, :loser_id
      t.string :winner_slack
      t.string :loser_slack
    end
  end
end
