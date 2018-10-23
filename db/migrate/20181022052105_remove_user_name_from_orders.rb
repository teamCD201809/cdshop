class RemoveUserNameFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :user_name, :string
  end
end
