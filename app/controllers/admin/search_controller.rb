class Admin::SearchController < AdminsController
  def index
    query = params[:q]
    @find_orders = Order.search_for query
  end
end