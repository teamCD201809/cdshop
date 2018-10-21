class Admin::TitlesController < ApplicationController

	def new
		@title = Title.new
		@disc = @title.discs.build
		@song = @disc.songs.build
		@artist = Artist.all.map{|o| [o.artist, o.id]}
		@genre = Genre.all.map{|o| [o.genre, o.id]}
		@label = Label.all.map{|o| [o.label, o.id]}
	end

	def create
		@title = Title.new(title_params)
		@title.save
		redirect_to admin_titles_path
	end

	def index
		# @titles = Title.page(params[:page]).reverse_order
		@titles = Title.search(params[:search])
		@cart_items = CartItem.where(user_id: current_user.id)
	end



	def show

	end

	def update
        @title = Title.find(params[:id])
        @title.update(title_params)
        # @disc = @title.discs
        # @disc.update(disc_params)
        # @discs = Disc.where(title_id: @title)
        # @discs.update(disc_params)
        redirect_to admin_titles_path
    end

	def edit
		@title = Title.find(params[:id])
		@discs = Disc.where(title_id: @title)
		@songs = Song.order(:song_order)
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
 	  	params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock, discs_attributes: [:id, :disc_name, :done, :_destroy, songs_attributes: [:id, :song_order, :song_title]])
    end
    # def disc_params
    # 	params.require(:disc).permit(:disc_name)
    # end
end
