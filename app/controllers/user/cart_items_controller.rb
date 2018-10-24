class User::CartItemsController < ApplicationController

	def create
     		@cart_items = CartItem.where(has_orders_items: false, user_id: current_user.id)
        @cart_item = CartItem.new(cart_item_params)
        @cart_item.user_id = current_user.id

        if CartItem.exists?(title_id: @cart_item.title_id, user_id: current_user.id, has_orders_items: false)
          @cart_item_exist = CartItem.find_by(title_id: @cart_item.title_id, user_id: current_user.id)
          @cart_item_exist.update(purchase_number: @cart_item_exist.purchase_number + @cart_item.purchase_number)
          else
           # @cart_item.title_id = current_title.id
            @cart_item.save
        end

        #sum = 0

       # @cart_items.each do |cart_item_exist|
        #  if cart_item_exist.title_id == @cart_item.title_id
         #   sum = cart_item_exist.purchase_number + cart_item.purchase_number
          #  @cart_item.destroy
           # @cart_item_exist.update(purchase_number: sum)
            #  else

           #end
        #end
		redirect_to user_titles_path
	end




    def index

      #@cart_items = CartItem.where(user_id: current_user)
      #@cart_items = CartItem.where(user_id: current_user.id).left_joins(orders_items = nil)
      #@cart_items = CartItem.left_joins(:order_item).select("*").where("order_items.id is null")
      #@cart_items =CartItem.where(user_id: current_user.id)
    	#@cart_items = CartItem.joins().where("(user_id = ?) AND (orders_items.id = ?)", current_user, nil)

      #@cart_items = CartItem.joins("LEFT OUTER JOIN orders_items ON cart_items.id = orders_items.cart_item_id").where("(orders_items.id = ?)", nil)
       # @cart_items = CartItem.joins("LEFT OUTER JOIN orders_items ON cart_items.id = orders_items.cart_item_id").where("(user_id = ?), (orders_items.id = ?)", current_user.id, nil)

       #@cart_items = CartItem.where("(orders_items.id = ?)", nil)

      # AND (orders_items.id = ?)", current_user, nil

      #@cart_items = CartItem.where(id: OrdersItem.select(:cart_item_id).group(:cart_item_id).having("count(cart_item_id) = ?", 0) );


        @cart_items = CartItem.where(has_orders_items: false, user_id: current_user.id)

        @orders_item = OrdersItem.new
        @orders_items = OrdersItem.all
        @orders = Order.all
        #@orders_items = OrdersItems.where(user_id: current_user.id)
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
