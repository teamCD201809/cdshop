class User::OrdersItemsController < ApplicationController

def create
    @cart_items = CartItem.where(user_id: current_user.id)
    # 購入してないもののみを表示する
    @order = Order.new

    @order.user_id = current_user.id
    @orders_item_purchase = 0

    @order.sub_post_code = current_user.postal_code
    @order.sub_address = current_user.address
    @order.save

    sum = 0
binding.pry
    @cart_items.each do |cart_item|
      orders_item = OrdersItem.new
      #binding.pry
      orders_item.order_id = @order.id
      orders_item.order_item_purchase = cart_item.title.price * cart_item.purchase_number
      orders_item.cart_item_id = cart_item.id
      #binding.pry
      orders_item.save
      #binding.pry
      sum += orders_item.order_item_purchase
      #binding.pry
    end
      binding.pry
      @order.update(order_purchase: sum)
      redirect_to user_cart_items_path
   end

end
