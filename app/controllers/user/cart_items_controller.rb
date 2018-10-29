class User::CartItemsController < ApplicationController
#before_action :authenticate_user!
	def create
    if current_user != nil
      @cart_items = CartItem.where(has_orders_items: false, user_id: current_user.id)
      @cart_item = CartItem.new(cart_item_params)
      @cart_item.user_id = current_user.id

      if @cart_item.title.stock > 0 && @cart_item.title.stock >= @cart_item.purchase_number

        if CartItem.exists?(title_id: @cart_item.title_id, user_id: current_user.id, has_orders_items: false)
          @cart_item_exist = CartItem.find_by(title_id: @cart_item.title_id, user_id: current_user.id, has_orders_items: false)
          @cart_item_exist.update(purchase_number: @cart_item_exist.purchase_number + @cart_item.purchase_number)
          #stock_after_purchase = @cart_item_exist.title.stock - @cart_item_exist.purchase_number
          #@cart_item_exist.title.update(stock: stock_after_purchase)
          redirect_to user_titles_path
        else
          @cart_item.save
          redirect_to user_titles_path
        end

      else
        redirect_to user_titles_path, notice: "在庫数が不足しています！"
      end

    else
      redirect_to new_user_session_path
	  end
  end
      #sum = 0
      # @cart_items.each do |cart_item_exist|
        #  if cart_item_exist.title_id == @cart_item.title_id
         #   sum = cart_item_exist.purchase_number + cart_item.purchase_number
          #  @cart_item.destroy
           # @cart_item_exist.update(purchase_number: sum)
            #  else




    def index
     # if current_user != nil
        @cart_items = CartItem.where(has_orders_items: false, user_id: current_user.id)
        @orders_item = OrdersItem.new
        @orders_items = OrdersItem.all
        @orders = Order.all
        @order = Order.new
        @delivery_addresses = DeliveryAddress.where(user_id: current_user)
        @delivery_address = DeliveryAddress.new
        
        if @cart_items.blank?
          @gamen_bunki = 1
        end
      #else
      #  redirect_to new_user_session_path

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
