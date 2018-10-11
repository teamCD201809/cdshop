class CreateTitles < ActiveRecord::Migration[5.2]
  def change
    create_table :titles do |t|
      t.string :title
      t.integer :artist_id
      t.integer :price
      t.integer :genre_id
      t.integer :label_id
      t.text :image_id
      t.integer :stock

      t.timestamps
    end
  end
end
