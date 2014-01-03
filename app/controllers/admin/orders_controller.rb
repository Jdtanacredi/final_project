class Admin::OrdersController < AdminsController

  def index
    @orders = Order.all
  end

end