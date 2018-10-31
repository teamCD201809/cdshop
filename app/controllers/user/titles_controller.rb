class User::TitlesController < ApplicationController

	def index
		@titles = Title.joins(:artist).search(params[:search]).page(params[:page])
		@cart_item = CartItem.new

	end

	def show
		@title = Title.find(params[:id])
		@cart_item = CartItem.new
		@discs = Disc.where(title_id: @title)
		@songs = Song.order(:song_order)
	end


	private
  	def cart_item_params
  		params.require(:cart_item).permit(:purchase_number, :user_id, :title_id)
  	end

end
