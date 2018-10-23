class AddUserNameToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :user_name, :string
  end
end
