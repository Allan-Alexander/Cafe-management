class CartItemsController < ApplicationController
    
    def new
        if Cart.exists?
            cart = Cart.last
            @cart_items = cart.cart_items
            render 'index'
        else 
            render 'empty'
        end   
    end

    def get_cart_id
        if Cart.exists? 
            return Cart.last.id
        else
            Cart.create(
                cart_date: Date.today,
                user_id: current_user.id # try to change this to a better form 
            )
            return Cart.last.id
        end
    end


    def create
        CartItem.create(
            cart_id: get_cart_id,
            menu_list_id: params[:menu_list_id],
            menu_list_name: params[:menu_list_name],
            menu_list_price: params[:menu_list_price]
        )
        redirect_to menu_list_path
    end

    def destroy
        id = params[:id]
        CartItem.delete(id)
        redirect_to cart_path
    end

end