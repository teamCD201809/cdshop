class AddHasOrdersItemsToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :has_orders_items, :boolean, default: false, null: false
  end
end
