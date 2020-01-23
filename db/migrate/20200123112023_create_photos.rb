class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: :uuid do |t|
      t.integer :position

      t.timestamps
    end
  end
end
