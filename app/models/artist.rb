class Artist < ApplicationRecord
	validates :artist, presence: true
	# belongs_to :titles
end
