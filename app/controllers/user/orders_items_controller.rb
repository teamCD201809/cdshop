class User::OrdersItemsController < ApplicationController

def create
    @cart_items = CartItem.where(user_id: current_user, has_orders_items: false)
    @order = Order.new
    @order.user_id = current_user.id

    flag = params[:c][:d]
    binding.pry
    if flag == "b"
      @order.sub_post_code = current_user.postal_code
      binding.pry
      @order.sub_address = current_user.address
    else
      binding.pry
      a = DeliveryAddress.find(params[:c][:d])
      binding.pry
      @order.sub_post_code = a.delivery_address_postal_code
      binding.pry
      @order.sub_address = a.delivery_address
    end

    binding.pry

    @order.save

    sum = 0
    @cart_items.each do |cart_item|
      orders_item = OrdersItem.new
      orders_item.order_id = @order.id
      orders_item.order_item_purchase = cart_item.title.price * cart_item.purchase_number
      orders_item.cart_item_id = cart_item.id
      k = cart_item.title.stock - cart_item.purchase_number
      cart_item.title.update(stock: k)
      orders_item.save
      cart_item.update(has_orders_items: true)
      sum += orders_item.order_item_purchase
    end
      @order.update(order_purchase: sum)
      redirect_to user_titles_path
   end
# 10/25以下テスト用に作成
end
