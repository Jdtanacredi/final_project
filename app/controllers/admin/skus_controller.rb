class Admin::SkusController < AdminsController
  before_action :find_sku, only: [:edit, :show, :update]
  def index
    @skus = Sku.all
  end

  def new
    @sku = Sku.new
  end

  def create
    sku = Sku.create safe_sku
    redirect_to sku
  end

  def show

  end

  def edit

  end

  def update
    @sku.update safe_sku
    redirect_to @sku
  end

  def destroy
    @sku.destroy
  end

  private

  def safe_sku
    params.require(:sku).permit(:sku_number, :size, :color, :product_id)
  end

  def find_sku
    @sku = Sku.find params[:id]
  end

end