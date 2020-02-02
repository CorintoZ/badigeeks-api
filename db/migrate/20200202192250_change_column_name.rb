class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    change_table :rooms do |t|
      t.rename :kind, :city
    end
  end
end
