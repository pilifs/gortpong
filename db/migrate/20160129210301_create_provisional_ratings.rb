class CreateProvisionalRatings < ActiveRecord::Migration
  def change
    create_table :provisional_ratings do |t|
      t.string :slack_handle
      t.integer :provisional_rating

      t.timestamps null: false
    end
  end
end
