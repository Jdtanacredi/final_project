class ProductsController < AdminsController
  before_action :find_product, only: [:edit, :show, :update]


  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.create safe_product
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



  private

  def safe_product
    params.require(:product).permit(:title, :description, :image_url, :price)
  end

  def find_product
    @product = Product.find params[:id]
  end

end