class User::OrdersItemsController < ApplicationController

def create
	@order_item = Order_item.new(order_item_params)
	@order_item.order_item_purchase = cart_item.
    @order_item.cart_item_id = 






	Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
       redirect_to user_titles_path
    else
       redirect_to user_cart_items_path

def order_params
        params.require(:order).permit(:order_purchase, :sub_post_code, :sub_address)
    end
end





t.integer "order_item_purchase"
    t.integer "cart_item_id"
    t.integer "order_id"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false


end
