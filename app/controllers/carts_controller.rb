class CartsController < ApplicationController
  before_action :authorize_user

  def show
    @order_items = current_order.order_items
  end

end
