class Genre < ApplicationRecord
	validates :genre, presence: true
	# belongs_to :titles
end
