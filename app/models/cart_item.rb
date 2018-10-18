class CartItem < ApplicationRecord
	belongs_to :title, optional: true
	belongs_to :user, optional: true
end
