class CartsController < ApplicationController
  before_action :find_cart, only: [:edit, :show, :update, :destroy]

  def index
    @carts = Cart.all
  end

  def show
    #@cart = Cart.find(params[:id])
  end

  def new
    @cart = Cart.new
  end

  def edit
    #@cart = Cart.find(params[:id])
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
   # @cart = Cart.find(params[:id])
    @cart.destroy
  end

end

private

def find_cart
  @cart = Cart.find(params[:id])
end