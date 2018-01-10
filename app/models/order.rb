class Order < ApplicationRecord

  belongs_to :account
  has_many :order_items

  before_create :update_status
  before_save :update_subtotal

  def calculate_subtotal
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def total_items
    self.order_items.collect { |item| item.quantity }.sum
  end

private

  def update_status
    if self.status == nil
      self.status = "In Progress"
    end
  end

  def update_subtotal
    self.subtotal = calculate_subtotal
  end

end
