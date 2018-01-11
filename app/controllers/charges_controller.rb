class ChargesController < ApplicationController
  before_action :authorize_user

  def new
    @order = current_order
  end

  def create
    # Amount in cents
    @order = current_order
    @order.order_number = Faker::Code.asin
    @order.save

    @amount = (@order.total_price * 100).to_i

    # Shipping information
    @name = params[:shipping][:'first-name']
    @address = params[:shipping][:address] + ", " + params[:shipping][:state] + ", " + params[:shipping][:'zip-code']
    @email = params[:stripeEmail]

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
