class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms, id: :uuid do |t|
      t.string :title
      t.integer :price
      t.string :description
      t.string :city
      t.integer :room_size
      t.integer :flat_size
      t.decimal :lat, :limit => 20
      t.decimal :lng, :limit => 20
      t.st_point :room_lnglat, geographic: true
      t.references :user, type: :uuid

      t.timestamps
    end
    add_index :rooms, :room_lnglat, using: :gist
  end
end
