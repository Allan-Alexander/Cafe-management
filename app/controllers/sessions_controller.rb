class SessionsController < ApplicationController
    skip_before_action :ensure_user_logged_in
    def new
        render 'new'
    end

    def create
        user = User.find_by(user_name: params[:user_name])
        if user && user.authenticate(params[:password])
            session[:current_user_id] = user.id
            session[:current_role] = user.role
            if user.role == "admin"
                redirect_to admin_path
            elsif user.role == "cashier"
                redirect_to cashier_path  
            else      
                redirect_to menu_list_path
            end
        else
            flash[:error] = "Your login attempt was invalid. Please retry !"
            redirect_to signin_path
        end    
    end

    def destroy
        session[:current_user_id] = nil
        @current_user = nil
        redirect_to home_path
    end

end