class Admin::UsersController < Admin::BaseController
  #  the order of before_action matters here
  before_action :find_user, only:[:edit,:show, :update, :destroy, :task]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: "#{@user.user_name} 已註冊成功！"
    else
      @error_message = @user.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def show; end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: '更新帳戶成功'
    else
      @error_message = @user.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    if @user != current_user
      if @user.destroy
        redirect_to admin_users_path, notice: '刪除帳戶成功'
      else
        redirect_to admin_users_path, notice: @user.errors.full_messages.to_sentence
      end
    else
      if @user.destroy
        session[:user_id] = nil
        redirect_to admin_users_path, notice: '刪除帳戶成功'
      else
        redirect_to admin_users_path, notice: @user.errors.full_messages.to_sentence
      end
    end
  end

  # 取得使用者的所有任務
  def task
    @q = @user.tasks.ransack(params[:q])
    @tasks = @q.result(distinct: true).page params[:page]
  end

  private

  def find_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :admin)
  end
end
