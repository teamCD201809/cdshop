class User::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.user_id = current_user.id
		#@cart_item.title_id = current_title.id
		@cart_item.save
		redirect_to user_titles_path
	end

    def index
    	@user = User.find(params[:id])
    end


	private
   	def cart_item_params
 	  	params.require(:cart_item).permit(:purchase_number, :title_id)
    end
end
