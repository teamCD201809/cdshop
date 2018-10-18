class Title < ApplicationRecord
#後藤変更
has_many :cart_items, dependent: :destroy
has_many :discs, dependent: :destroy
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
belongs_to :artist
belongs_to :genre
belongs_to :label
attachment :image


#廣重変更
	# def self.search(search) #self.でクラスメソッドとしている
 #    	if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
 #      		Title.where('title LIKE ? OR genre LIKE ?', "%#{search}%"])
 #    	else
 #      		Title.all #全て表示。
 #    	end
	# end


end
