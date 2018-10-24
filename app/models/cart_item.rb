class CartItem < ApplicationRecord
	belongs_to :title
	belongs_to :user
    has_one :orders_item

end
