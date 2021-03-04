class MenuListsController < AdminController
  skip_before_action :ensure_user_role
  # GET /menu_lists or /menu_lists.json

 

  def index
    menu_list = Menu.find_by(id: getId) 
    @menu_title = menu_list.menu_title
    @menu_items = menu_list.menu_lists 
    render 'index', locals: {user_name: current_user.user_name}
    # render json: @menu_list.menu_lists
  end

  def create
    name = params[:menu_name]
    description = params[:menu_description]
    menu_id = params[:menu_id]  # change this to Menu.Id
    price = params[:menu_price]
    MenuList.create(
      menu_name: name,
      menu_description: description,
      menu_id: menu_id,
      menu_price: price
    )
  end

  def delete
    id = params[:id]
    MenuList.delete(id)
    render plain: "deleted id: #{id}"
  end

  def orderStatus
     @order_id = params[:id]
     render 'order_status'
  end

  def cancelOrder
    delete_id = params[:id]
    User.find(@current_user.id).orders.find(delete_id).delete
    redirect_to menu_list_path
  end
  
end
