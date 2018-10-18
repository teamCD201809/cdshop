class Genre < ApplicationRecord
	validates :genre, presence: true
	has_many :titles, dependent: :destroy
end
