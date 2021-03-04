class AdminController < ApplicationController
    before_action :ensure_user_role, except: [:setId]
    
    
    
    def new
        @getAllOrders = Order.all
        @getAllMenuTitles = Menu.all
        render 'index'
    end

    def getOrderById
        id = params[:id]
        @orderDetails = Order.find(id).order_items
    end

    def getById
        id = params[:id]
        $getId = id
        @title = Menu.find(id).menu_title
        @details = Menu.find(id).menu_lists
        render 'detail'
    end

    def orderDetails
        @order_id = params[:id]
        render 'order_details'
    end

    def updateOrder
        id = params[:id]
        Order.update(id,delivered_at: true)
        redirect_to admin_path
    end

    def deleteMenuList
        id = params[:id]
        MenuList.delete(id)
        redirect_to admin_path
    end

    def newList 
       render 'add_list'
    end

    def createNewMenu
        new_menuTitle = Menu.new(
            menu_title: params[:menu_title]
        )
        if new_menuTitle.save
            redirect_to admin_path
        else
            flash[:error] = new_menuTitle.errors.full_messages.join(", ")
            redirect_to admin_path
        end        
    end

    def createNewList
        menu = MenuList.new(
            menu_id: params[:menu_id],
            menu_name: params[:menu_name],
            menu_description: params[:menu_description],
            menu_price: params[:menu_price]
        )
        if menu.save
            redirect_to admin_path
        else    
            flash[:error]  = menu.id #menu.errors.full_messages.join(", ")
            redirect_to newList_path
        end
    end

    def deleteMenuTitle
        id = params[:id]
        menus = MenuList.where(:menu_id => id)
        menus.each do |menu|
            menu.destroy
        end     
        Menu.delete(id)
        redirect_to admin_path
    end

    def setId
        if params[:id] == nil
            @main_id = Menu.first.id
        else
            @main_id = params[:id]    
        end
    end

    def getMainId
        return @main_id
    end

end