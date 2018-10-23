class OrdersItem < ApplicationRecord
belongs_to :user
belongs_to :cart_item
belongs_to :order #←必要？
end
