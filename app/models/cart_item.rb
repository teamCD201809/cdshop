class CartItem < ApplicationRecord
	default_scope -> {order(created_at: :desc)}
	belongs_to :title
	belongs_to :user
    has_one :orders_item

end
