class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.integer :band_id, null: false
      t.string :title, null: false
      t.string :year, null: false
      t.string :album_type, null: false
    end
    add_index :albums, :band_id
  end
end
