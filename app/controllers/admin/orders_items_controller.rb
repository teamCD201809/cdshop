class Admin::OrdersItemsController < ApplicationController

  def update
     orders_item = OrdersItem.find(params[:id])
     orders_item.update(orders_item_params)
     redirect_to admin_orders_path
  end

  private
   	def orders_item_params
 	  	params.require(:orders_item).permit(:status)
    end
end
