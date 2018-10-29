class OrdersItem < ApplicationRecord
belongs_to :cart_item
belongs_to :order
enum status:{受付: 0,商品準備中: 1,出荷済: 2}

validates :cart_item_id, presence: true
end
