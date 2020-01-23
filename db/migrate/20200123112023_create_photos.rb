# frozen_string_literal: true

class CreatePhotos < ActiveRecord::Migration[6.0]
  def change
    create_table :photos, id: :uuid do |t|
      t.integer :position
      t.references :room, type: :uuid

      t.timestamps
    end
  end
end
