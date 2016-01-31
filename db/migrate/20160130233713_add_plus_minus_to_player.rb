class AddPlusMinusToPlayer < ActiveRecord::Migration
  def change
    add_column :players, :plus_minus, :integer
  end
end
