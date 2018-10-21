class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|

      t.integer :title_id, null: false
      t.integer :quantity, null: false, default: "1"
      t.integer :total_purchase
      t.timestamps
    end
  end
end
