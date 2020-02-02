class FixColumnNames < ActiveRecord::Migration[6.0]
  def change
    change_table :rooms do |t|
      t.rename :city, :city
    end
  end
end
