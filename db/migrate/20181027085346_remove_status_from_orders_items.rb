class RemoveStatusFromOrdersItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders_items, :status, :integer
  end
end
