class UsersController < ApplicationController

  def sign_up
    @user = User.new
  end

  def sign_in
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
        redirect_to list_tasks_path
    else
        render :sign_up
    end
  end

  def profile
  end

  private
    def user_params
      params.require(:user).permit(:user_name, :password, :password_confirmation, :email)
    end 

end