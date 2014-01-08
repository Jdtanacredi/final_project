class Admin::OrdersController < AdminsController
  def index
    @orders = Order.all
  end

  def create
    @order = Order.new
  end

  def show
    @order = Order.find params[:id]
  end

  def new
    @order = Order.new
  end

  def destroy
    @order = Order.find params[:id]
      @order.destroy
      redirect_to admin_orders_path
  end



end