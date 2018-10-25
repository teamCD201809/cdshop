class CreateOrdersItems < ActiveRecord::Migration[5.2]
  def change
    create_table :orders_items do |t|
      t.integer :order_item_purchase
      t.integer :cart_item_id
      t.integer :order_id
      t.integer :status,default: 0, null: false

      t.timestamps
    end
  end
end
