class AddStatusToOrdersItems < ActiveRecord::Migration[5.2]
  def change
    add_column :orders_items, :status, :integer, default: 0, null: false
  end
end
