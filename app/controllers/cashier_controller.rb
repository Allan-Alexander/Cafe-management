class CashierController < ApplicationController
    before_action :ensure_cashier_role

    def new
        render 'index'
    end

    def updateOrder
        id = params[:id]
        Order.update(id,delivered_at: true)
        redirect_to cashier_path
    end

end