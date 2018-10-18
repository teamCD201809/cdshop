class Admin::TitlesController < ApplicationController

	def new
		@title = Title.new
		@artist = Artist.all.map{|o| [o.artist, o.id]}
		@genre = Genre.all.map{|o| [o.genre, o.id]}
		@label = Label.all.map{|o| [o.label, o.id]}
		@disc = @title.discs.build
		@song = @disc.songs.build
	end

	def create
		@title = Title.new(title_params)
		@title.save
		redirect_to admin_titles_path
	end

	def index
		@titles = Title.page(params[:page]).reverse_order
	end



	def show

	end

	def update
        @title = Title.find(params[:id])
        @title.update(title_params)
        redirect_to admin_titles_path
    end


	def find

	end

	def edit
		@title = Title.find(params[:id])
		@artist = Artist.all.map{|o| [o.artist, o.id]}
		@genre = Genre.all.map{|o| [o.genre, o.id]}
		@label = Label.all.map{|o| [o.label, o.id]}
	end

	def destroy
		@title = Title.find(params[:id])
		@title.destroy
		redirect_to admin_titles_path
	end

	private
   	def title_params
 	  	params.require(:title).permit(:title, :artist_id, :price, :genre_id, :label_id, :image, :stock, discs_attributes: [:id, :disc_name, :done, :_destroy])
    end
end
