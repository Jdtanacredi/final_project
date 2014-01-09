class Admin::ProductsController < AdminsController
  before_action :find_product, only: [:edit, :show, :update]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create safe_product
    expired_at = @product.created_at + 2.days
    expired_at.save!
    redirect_to product
  end

  def show
    #@product = Product.find params[:id]
  end

  def edit
   # @product = Product.find params[:id]
  end

  def update
    @product.update safe_product
    redirect_to @product
   # @product = Product.find params[:id]
  end

  def destroy
    @product.destroy
  end

  #def expired?
  #  hide_product = @product.created_at + 2.days
  #  Time.now < hide_product
  #end
  #helper_method :expired?

  private

  def safe_product
    params.require(:product).permit(:title, :description, :image_url, :price)
  end

  def find_product
    @product = Product.find params[:id]
  end

end