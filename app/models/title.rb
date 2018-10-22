class Title < ApplicationRecord
#後藤変更
validates :title, :price, :stock, presence: true
has_many :cart_items, dependent: :destroy
has_many :discs, dependent: :destroy
accepts_nested_attributes_for :discs, reject_if: :all_blank, allow_destroy: true
belongs_to :artist
belongs_to :genre
belongs_to :label
attachment :image


#廣重変更
	def self.search(search) #self.でクラスメソッドとしている
      if search
      Title.where(['title LIKE ? OR artist LIKE ?', "%#{search}%", "%#{search}%"]).reverse_order


      #if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
    		#Title.where(genre_id: (Genre.find_by(['genre LIKE ?', "%#{search}%"])).id)
    		#Title.where(['title LIKE ?', "%#{search}%"])

      # if ['title LIKE ?', "%#{search}%"] != nil
      #   Title.where(['title LIKE ?', "%#{search}%"])



  #   	if ['title LIKE ?', "%#{search}%"] != nil
		# 	Title.where(['title LIKE ?', "%#{search}%"])

		# elsif ['genre LIKE ?', "%#{search}%"] != nil
  #   		Title.where(genre_id: (Genre.find_by(['genre LIKE ?', "%#{search}%"])).id)

  #   	elsif ['artist LIKE ?', "%#{search}%"] != nil
  #   		Title.where(artist_id: (Artist.find_by(['artist LIKE ?', "%#{search}%"])).id)

    	# if ['artist LIKE ?', "%#{search}%"] != nil
    	# 	Title.where(artist_id: (Artist.find_by(['artist LIKE ?', "%#{search}%"])).id)

    		# elsif ['genre LIKE ?', "%#{search}%"] != nil
    		# Title.where(genre_id: (Genre.find_by(['genre LIKE ?', "%#{search}%"])).id)

    		# end


    		# genre_search = Genre.find_by(['genre LIKE ?', "%#{search}%"]) || Title.where(['title LIKE ?', "%#{search}%"])
      # 		Title.where(genre_id: genre_search.id)

      		# a = ['genre LIKE ?', "%#{search}%"]
      		# b = Genre.find_by(genre: "jpop")



      		#Title.where(genre_id: (Genre.find((['genre LIKE ?', "%#{search}%"]).id).id))
      		#(Genre.where(['genre LIKE ?', "%#{search}%"])).id)
      		#Title.where(Genre.where(['genre LIKE ?', "%#{search}%"]))
    	else
      	Title.all.reverse_order #表示。
    	end
	end


end
