class FixColumnNames < ActiveRecord::Migration[6.0]
    def change
      change_table :rooms do |t|
        t.rename :kind, :city
    end

    change_table :photos do |t|
      t.rename :url_small_photo, :url_small
      t.rename :url_big_photo, :url_big
    end
  end
end
