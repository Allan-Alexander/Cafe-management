class UsersController < ApplicationController
  skip_before_action :ensure_user_logged_in
 
  def new 
    render 'new'
  end 

  def create
    new_user = User.new(
      user_name: params[:user_name],
      password: params[:password],
      role: "user"
    )

    if new_user.save
        redirect_to home_path
    else
       flash[:error]  = new_user.errors.full_messages.join(", ")
       redirect_to signup_path
    end
  end
 
end
