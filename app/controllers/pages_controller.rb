class PagesController < ApplicationController
  before_action :authorize_user, only: [:profile]

  def home
    @recently_added = Product.recently_added
    @most_reviewed = Product.most_reviewed
  end

  def profile
    @user = current_user
    @account = current_user.account
    @order_history = Order.completed(@user)
    @reviews = @account.reviews
  end

  def contact
    
  end

end
