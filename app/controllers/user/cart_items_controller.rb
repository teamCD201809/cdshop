class User::CartItemsController < ApplicationController

	def create
		@cart_item = CartItem.new(cart_item_params)
        @cart_item.user_id = current_user.id
		#@cart_item.title_id = current_title.id
		@cart_item.save
		redirect_to user_titles_path
	end

    def index
    	@cart_items = CartItem.where(user_id: current_user.id)
        # @orders_item = OrdersItem.new ←こちらに戻す
        @orders_items = OrdersItems.find(user_id: current_user.id)
    end

    def destroy
        cart_item = CartItem.find(params[:id])
    	cart_item.destroy
    	redirect_to user_cart_items_path
    end

    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to user_cart_items_path
    end

	private
   	def cart_item_params
 	  	params.require(:cart_item).permit(:purchase_number, :title_id)
    end

end
