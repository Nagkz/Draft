class UsersController < ApplicationController
  def show
    @user = User.find(params[:id]) 
  end

  def user_admin
    @users = User.all
    if  current_user.admin == false
        redirect_to root_path
    else
        render action: "request/index"
    end
 end
end