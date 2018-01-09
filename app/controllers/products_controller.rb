class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @reviews = @product.reviews
  end

  def new
    @product = Product.new
  end

  def create
    if product = Product.create!(product_params)
      redirect_to products_path, notice: "Product successfully added."
    else
      render :new
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

end
