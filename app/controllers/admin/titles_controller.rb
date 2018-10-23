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



	def show

	end

	def update
        @title = Title.find(params[:id])
        @title.update(title_params)
        # @discs = Disc.where(title_id: @title)
        # @discs.each do |disc|
        # 	disc.update(disc_params)
        # end
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
   		# params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock, discs_attributes: [:id, :disc_name, :done, :_destroy], songs_attributes: [:id, :song_order, :song_title, :audio, :done, :_destroy])
 	  	params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock, discs_attributes: [:id, :disc_name, :done, :_destroy, songs_attributes: [:id, :song_order, :song_title, :audio, :_destroy]])
    end
    def disc_params
    	params.require(:disc).permit(discs_attributes: [:disc_name])
    end
end
