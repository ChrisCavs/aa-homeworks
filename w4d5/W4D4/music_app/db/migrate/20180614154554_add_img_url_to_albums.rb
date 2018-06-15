class AddImgUrlToAlbums < ActiveRecord::Migration[5.1]
  def change
    add_column :albums, :url, :string, null: false
  end
end
