class Admin::UsersController < AdminsController
  def index
    @users = User.all
  end

  def show
  end
end