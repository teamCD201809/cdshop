class RemovePurchaseDateFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :purchase_date, :datetime
  end
end
