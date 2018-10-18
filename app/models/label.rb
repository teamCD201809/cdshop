class Label < ApplicationRecord
	validates :label, presence: true
	has_many :titles, dependent: :destroy
end
