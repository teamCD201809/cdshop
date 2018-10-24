class Title < ApplicationRecord
#後藤変更
validates :title, :price, :stock, presence: true
has_many :cart_items, dependent: :destroy
has_many :discs, dependent: :destroy
belongs_to :artist
belongs_to :genre
belongs_to :label
attachment :image
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true


#廣重変更
	def self.search(search) #self.でクラスメソッドとしている
      if search
      Title.where(['title LIKE ? OR artist LIKE ?', "%#{search}%", "%#{search}%"]).reverse_order

    	else
      	Title.all.reverse_order
    	end
	end


end
