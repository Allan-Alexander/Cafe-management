class OrderItemsController < ApplicationController
    
    @current_order = 0

    def new
    end

    def get_order_id
        if @current_order == 0
            Order.create(
                order_date: Date.today,
                user_id: current_user.id 
            )
            @current_order = 1
            user = User.find(current_user.id)
            return user.orders.last.id
        else
            user = User.find(current_user.id)
            return user.orders.last.id
        end
    end

    def create
        @current_order = 0
        cartItems = CartItem.all
        cartItems.each do |items|

            OrderItem.create(
            order_id: get_order_id,
            menu_list_id: items.menu_list_id,
            menu_item_name: items.menu_list_name,
            menu_item_price: items.menu_list_price
            )
        end
         
        Cart.delete_all
        CartItem.delete_all
        redirect_to menu_list_path 
    end
end