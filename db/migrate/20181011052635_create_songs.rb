class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.integer :disc_id
      t.integer :song_order
      t.string :song_title

      t.timestamps
    end
  end
end