class Order < ApplicationRecord

  belongs_to :account
  has_many :order_items

  before_create :update_status
  before_save :update_subtotal, :update_total

  scope :in_progress, -> (user) {where(account_id: user.account.id, status: 'In Progress')}

  def calculate_subtotal
    self.order_items.collect { |item| item.product.price * item.quantity }.sum
  end

  def calculate_tax
    self.tax = self.subtotal * 0.1
  end

  def total_items
    self.order_items.collect { |item| item.quantity }.sum
  end

  def order_complete
    self.update(status: 'Completed')
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

  def update_total
    calculate_tax
    self.shipping = 15.0
    self.total_price = self.subtotal + self.tax + self.shipping
  end

end
