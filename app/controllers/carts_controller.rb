class CartsController < ApplicationController
  #before_action :find_cart, only: [:edit, :show, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    begin
      @cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: 'Invalid cart'
    else
    end
  end

  def new
    @cart = Cart.new
  end

  def edit
    @cart = Cart.find(params[:id])
  end

  def create
    @cart = Cart.new(params[:id])

    if @cart.save
      redirect_to @cart
    else
      render action: 'new'
    end
  end

  def update
    #@cart = Cart.find(params[:id])

    if @cart.update_attributes(params[:cart])
      redirect_to @cart
    else
      render action 'edit'
    end
  end

  def destroy
   @cart = Cart.find(params[:id])
    @cart.destroy
    session[:cart_id] = nil
    redirect_to root_url

  end

end

private

def find_cart
  @cart = Cart.find(params[:id])
end