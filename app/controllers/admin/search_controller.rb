class Admin::SearchController < AdminsController
  def index
    query = params[:q]
    @orders = Order.search_for query
  end
end