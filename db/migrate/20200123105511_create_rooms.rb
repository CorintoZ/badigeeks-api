# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.decimal :lat, :limit => 20
      t.decimal :lng, :limit => 20
      t.string :kind
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
