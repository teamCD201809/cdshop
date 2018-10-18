class User::TitlesController < ApplicationController
#before_action :authenticate_user!

	def index
		@titles = Title.page(params[:page]).reverse_order
		@cart_item = CartItem.new

	end

	def show
		@title = Title.find(params[:id])
		@cart_item = CartItem.new
	end

	def find

	end

	private
  	def cart_item_params
  		params.require(:cart_item).permit(:purchase_number, :user_id, :title_id)
  	end

end
