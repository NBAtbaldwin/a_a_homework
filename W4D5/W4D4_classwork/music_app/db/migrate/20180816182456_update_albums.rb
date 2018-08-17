class UpdateAlbums < ActiveRecord::Migration[5.2]
  def change
    change_column_default :albums, :album_type, from: nil, to: 'studio'
  end
end
