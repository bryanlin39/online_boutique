class ProductsController < ApplicationController
  before_action :authorize_admin, except: [:index, :show]

  def index
    @sort_option = params[:sort]
    if @sort_option == 'rating'
      @products = Product.rating_highest
    elsif @sort_option == 'new'
      @products = Product.date_newest
    elsif @sort_option == 'old'
      @products = Product.date_oldest
    elsif @sort_option == 'low'
      @products = Product.price_lowest
    elsif @sort_option == 'high'
      @products = Product.price_highest
    else
      @products = Product.alphabetical
    end
  end

  def show
    @product = Product.find(params[:id])
    @order_item = current_order.order_items.new
    @reviews = @product.reviews.page(params[:page] || 1).per(5)
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

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update!(product_params)
      redirect_to product_path(@product), notice: "Product successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.reviews.each do |review|
      review.destroy
    end
    @product.destroy
    redirect_to products_path, notice: "Product successfully removed."
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :price, :image)
  end

end
