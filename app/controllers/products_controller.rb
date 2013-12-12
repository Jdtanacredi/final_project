class ProductsController < ApplicationController
##CREATE A NEW PRODUCTS CONTROLLER IN MAIN FOLDER NOT ADMIN. THIS WILL TALK TO STORE READ UP ON NAMESPACES!!!!!!
  def show
    @product = Product.find params[:id]
  end

end