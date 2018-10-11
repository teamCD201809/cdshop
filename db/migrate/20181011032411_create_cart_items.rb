class CreateCartItems < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_items do |t|
      t.integer :purchase_number
      t.integer :user_id
      t.integer :title_id

      t.timestamps
    end
  end
end
