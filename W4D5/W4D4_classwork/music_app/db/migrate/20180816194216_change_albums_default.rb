class ChangeAlbumsDefault < ActiveRecord::Migration[5.2]
  def change
    change_column_default :albums, :album_type, from: 'studio', to: "studio"
  end
end
