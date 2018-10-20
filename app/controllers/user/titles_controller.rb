class User::TitlesController < ApplicationController
#before_action :authenticate_user!

	def index
		@titles = Title.search(params[:search])
		@cart_item = CartItem.new

	end

	def show
		@title = Title.find(params[:id])
		@cart_item = CartItem.new
		@discs = Disc.where(title_id: @title)
		@songs = Song.order(:song_order)
	end

	def find

	end

	private
  	def cart_item_params
  		params.require(:cart_item).permit(:purchase_number, :user_id, :title_id)
  	end

end
