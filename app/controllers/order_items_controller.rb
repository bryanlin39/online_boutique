class OrderItemsController < ApplicationController

  def create
    product = Product.find(params[:order_item][:product_id].to_i)
    order = current_order
    order.order_items.new(order_item_params)
    order.save
    session[:order_id] = order.id
    redirect_to product_path(product), notice: "You've updated your shopping cart."
  end

  def destroy
    order = current_order
    item = OrderItem.find(params[:id])
    item.destroy
    order.save
    redirect_to cart_path, notice: "You've updated your shopping cart."
  end

private

  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

end
