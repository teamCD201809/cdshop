class Title < ApplicationRecord
#廣重変更
def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Title.where('title LIKE ? OR genre LIKE ?', "%#{search}%"])
    else
      Title.all #全て表示。
    end
  end
end

end
