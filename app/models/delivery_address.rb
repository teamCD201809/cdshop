class DeliveryAddress < ApplicationRecord
belongs_to :user
has_many :orders
validates :delivery_address_postal_code, presence: true, length: { is: 7}, numericality:{only_integer: true}
validates :delivery_address, presence: true
end
