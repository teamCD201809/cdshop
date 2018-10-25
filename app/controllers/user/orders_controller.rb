class User::OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)
    @order.save
    binding.pry
    redirect_to user_cart_items_path
  end

 private
    def order_params
      params.require(:order).permit(:sub_post_code, :sub_address)
    end

end