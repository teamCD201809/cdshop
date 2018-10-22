class OrdersItem < ApplicationRecord
	enum status:{受付:0, 商品準備中:1,　出荷済:2}
end
