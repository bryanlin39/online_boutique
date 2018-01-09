class ReviewsController < ApplicationController

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    @review.account = current_user.account
    if @review.save
      redirect_to product_path(@product), notice: 'Your review was submitted.'
    else
      render :new
    end
  end

private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

end
