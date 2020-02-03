class ChangePriceTypeForFloat < ActiveRecord::Migration[6.0]
  def change
    change_table :rooms do |t|
      t.change :price, :float
    end
  end
end
