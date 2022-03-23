<<<<<<< HEAD
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
        redirect_to "/"
    else
        render :sign_up
    end
  end

  def profile
  end

  private
    def user_params
      params.require(:user).permit(:role, :password, :email)
    end 

end
=======
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
        redirect_to "/"
    else
        render :sign_up
    end
  end

  def profile
  end

  private
    def user_params
      params.require(:user).permit(:role, :password, :email)
    end 

end
>>>>>>> 3e42cdfe837180ed913cd91fa6a5123a7c89c3c1
