class OrderItemsController < ApplicationController
  before_action :authorize_user

  def create
    product = Product.find(params[:order_item][:product_id].to_i)
    order = current_order
    order.account = current_user.account
    order.order_items.new(order_item_params)
    order.save
    session[:order_id] = order.id
    redirect_to cart_path, notice: "You've updated your shopping cart."
  end

  def destroy
    order = current_order
    @item = OrderItem.find(params[:id])
    @item.destroy
    order.save

    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end

private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

end
