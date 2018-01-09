class ReviewsController < ApplicationController
  before_action :find_product
  before_action :authorize_user

  def new
    @review = Review.new
  end

  def create
    @review = @product.reviews.new(review_params)
    @review.account = current_user.account
    if @review.save
      redirect_to product_path(@product), notice: 'Your review has been submitted.'
    else
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to product_path(@product), notice: 'Your review has been updated.'
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product), notice: 'Review has been deleted.'
  end

private

  def find_product
    @product = Product.find(params[:product_id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
