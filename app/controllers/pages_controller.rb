class PagesController < ApplicationController

  def home
  end

  def profile
    @user = current_user
    @account = current_user.account
    @order_history = Order.completed(@user)
    @reviews = @account.reviews
  end

end
