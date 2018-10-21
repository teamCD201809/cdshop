class User::OrdersController < ApplicationController

def create
	@order = Order.new(order_params)
    if @order.save
       redirect_to user_titles_path
    else
       redirect_to user_cart_items_path

def order_params
        params.require(:order).permit(:order_purchase, :sub_post_code, :sub_address, :cart_item_id, :order_id)
    end
end

