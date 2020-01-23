class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.integer :age

      t.timestamps
    end
  end
end