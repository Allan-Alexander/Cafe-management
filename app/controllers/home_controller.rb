class HomeController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def index
        if current_user
            if current_user.role == "admin"
                redirect_to admin_path
            elsif current_user.role == "cashier"
                redirect_to cashier_path
            else   
                redirect_to menu_list_path
            end
        else     
           render 'index'
        end
    end
end