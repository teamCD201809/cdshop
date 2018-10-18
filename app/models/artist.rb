class Artist < ApplicationRecord
	validates :artist, presence: true
	has_many :titles, dependent: :destroy
end
