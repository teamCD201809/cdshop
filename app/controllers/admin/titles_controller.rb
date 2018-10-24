class Admin::TitlesController < ApplicationController

	def new
		@title = Title.new
		@artist_select = Artist.all.map{|o| [o.artist, o.id]}
		@genre_select = Genre.all.map{|o| [o.genre, o.id]}
		@label_select = Label.all.map{|o| [o.label, o.id]}
	end

	def create
		@title = Title.new(title_params)
		@title.save
		redirect_to admin_titles_path
	end

	def index
		@titles = Title.joins(:artist).search(params[:search]).page(params[:page])
		@cart_items = CartItem.where(user_id: current_user.id)
	end

	def update
        @title = Title.find(params[:id])
        @title.update(title_params)
        redirect_to admin_titles_path
    end

	def edit
		@title = Title.find(params[:id])
		@artist_select = Artist.all.map{|o| [o.artist, o.id]}
		@genre_select = Genre.all.map{|o| [o.genre, o.id]}
		@label_select = Label.all.map{|o| [o.label, o.id]}
	end

	def destroy
		@title = Title.find(params[:id])
		@title.destroy
		redirect_to admin_titles_path
	end

	private
   	def title_params
 	  	params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock, discs_attributes: [:disc_name, :_destroy, :id,  songs_attributes: [:song_order, :song_title, :audio, :_destroy, :id]])
    end
    def update_title_params
 	  	params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock)
    end
    def update_disc_params
 	  	params.require(:disc).permit(:disc_name, :_destroy, :id)
    end
end
