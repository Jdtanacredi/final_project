class Admin::UsersController < AdminsController
  def index
    @users = User.all
  end

  def show
    @users
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to admin_users_path
  end

end