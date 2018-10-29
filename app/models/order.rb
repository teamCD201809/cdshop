class Order < ApplicationRecord
belongs_to :user
has_many :orders_items, dependent: :destroy

validates :sub_post_code, presence: true
validates :sub_address, presence: true

end
