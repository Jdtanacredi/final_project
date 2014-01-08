class ProductsController < ApplicationController
##CREATE A NEW PRODUCTS CONTROLLER IN MAIN FOLDER NOT ADMIN. THIS WILL TALK TO STORE READ UP ON NAMESPACES!!!!!!
  before_action :find_product

  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def create
  @product = Product.new
   save.expired_at = @product.created_at
  end



private

  def find_product
    @product = Product.find params[:id]
  end

end