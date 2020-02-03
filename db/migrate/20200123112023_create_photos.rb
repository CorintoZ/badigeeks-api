class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: :uuid do |t|
      t.integer :position
      t.string :url_small
      t.string :url_big
      t.references :room, type: :uuid

      t.timestamps
    end
  end
end
