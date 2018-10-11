class CreateDeliveryAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :delivery_addresses do |t|
      t.string :delivery_address_postal_code
      t.string :delivery_address
      t.integer :user_id

      t.timestamps
    end
  end
end
