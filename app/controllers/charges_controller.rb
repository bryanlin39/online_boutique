class ChargesController < ApplicationController

  def new
    @order = current_order
  end

  def create
    # Amount in cents
    @order = current_order
    @amount = (@order.subtotal * 100).to_i

    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => @amount,
      :description => 'Online Boutique charge',
      :currency    => 'usd'
    )

    @order.order_complete
    session[:order_id] = nil

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

end
