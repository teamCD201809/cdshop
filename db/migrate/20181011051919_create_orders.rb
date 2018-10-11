class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :order_purchase
      t.datetime :purchase_date
      t.string :sub_post_code
      t.string :sub_address

      t.timestamps
    end
  end
end
