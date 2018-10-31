class User::OrdersController < ApplicationController
  def create
    @order = Order.new
    binding.pry
    a = DeliveryAddress.find(params[:c][:d])
     binding.pry
    @order.sub_post_code = a.delivery_address_postal_code
     binding.pry
    @order.sub_address = a.delivery_address
    @order.user_id = current_user.id
    @order.save
    binding.pry
    redirect_to user_cart_items_path
    binding.pry
  end

end

#上記文章不使用 20181029 廣重