class RemoveSlackHandleFromRating < ActiveRecord::Migration
  def change
    change_table :ratings do |t|
      t.remove :slack_handle
    end
    change_table :provisional_ratings do |t|
      t.remove :slack_handle
    end
  end
end
