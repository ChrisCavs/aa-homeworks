class ModifyLikesTable < ActiveRecord::Migration[5.1]
  def change
    remove_column :likes, :band_id
    add_column :likes, :album_id, :integer, null: false
  end
end
