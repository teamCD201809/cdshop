class User::DeliveryAddressesController < ApplicationController

  def create
    @delivery_address = DeliveryAddress.new(delivery_address_params)
    @delivery_address.user_id = current_user.id
    if @delivery_address.save
    	redirect_to user_cart_items_path
    else
        @cart_items = CartItem.where(has_orders_items: false, user_id: current_user.id)
        @orders_item = OrdersItem.new
        @delivery_addresses = DeliveryAddress.where(user_id: current_user.id)
        render :template => "user/cart_items/index"
        if @cart_items.blank?
          @gamen_bunki = 1
        end
    end
  end

  def destroy
    delivery_address = DeliveryAddress.find(params[:id])
    delivery_address.destroy
    redirect_to user_cart_items_path
  end

  private
  def delivery_address_params
      params.require(:delivery_address).permit(:delivery_address_postal_code, :delivery_address, :user_id)
    end
end
