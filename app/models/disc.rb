class Disc < ApplicationRecord
	validates :disc_name, presence: true
	belongs_to :title
	has_many :songs, dependent: :destroy
	accepts_nested_attributes_for :songs, reject_if: :all_blank, allow_destroy: true

end
