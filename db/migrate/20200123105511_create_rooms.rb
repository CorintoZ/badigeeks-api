# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :kind
      t.integer :room_size
      t.integer :flat_size
      t.decimal :lat, :limit => 20
      t.decimal :lng, :limit => 20
      t.references :user, type: :uuid

      t.timestamps
    end
  end
end
