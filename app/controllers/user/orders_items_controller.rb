class User::OrdersItemsController < ApplicationController

def create
    @cart_items = CartItem.where(user_id: current_user.id)
    @order = Order.new

    @ordes_item_purchase = 0

    @cart_items.each do |cart_item|
      orders_item = OrdersItem.new
      orders_item.order_item_purchase = cart_item.title.price * cart_item.purchase_number
      orders_item.cart_item_id = cart_item.id

      orders_item.save
    end
      redirect_to user_titles_path
end

    order.order_purchase = cart
    order.purchase_date = cart_item.created_at
    order.sub_post_code = current_user.postal_code
    order.address = current_user.address






    private
    def orders_item_params
        params.require(:orders_item).permit(:order_item_purchase)
    end
end
