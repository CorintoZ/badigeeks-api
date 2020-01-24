# frozen_string_literal: true

class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.decimal :lat, :limit => 20
      t.st_point :room_lonlat, geographic: true
      t.string :kind
      t.references :user, type: :uuid

      t.timestamps
    end
    add_index :rooms, :room_lonlat, using: :gist
  end
end
