class CreateLikes < ActiveRecord::Migration[5.1]
  def change
    create_table :likes do |t|
      t.integer :user_id, null: false
      t.integer :band_id, null: false
    end
    add_index :likes, :user_id
    add_index :likes, :band_id
  end
end
