class Song < ApplicationRecord
	validates :song_order, :song_title, presence: true
	belongs_to :disc
end
