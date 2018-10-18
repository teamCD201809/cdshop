class CartItem < ApplicationRecord
	belongs_to :title
	belongs_to :user
end
