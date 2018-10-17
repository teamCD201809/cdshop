class Label < ApplicationRecord
	validates :label, presence: true
	# belongs_to :titles
end
