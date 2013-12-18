class ProductsController < ApplicationController
##CREATE A NEW PRODUCTS CONTROLLER IN MAIN FOLDER NOT ADMIN. THIS WILL TALK TO STORE READ UP ON NAMESPACES!!!!!!
  before_action :find_product

  def index
    @product = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

private

  def find_product
    @product = Product.find params[:id]
  end

end