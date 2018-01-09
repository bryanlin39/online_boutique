class Review < ApplicationRecord

  belongs_to :product
  belongs_to :account

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

  after_save :update_product_rating

  def update_product_rating
    self.product.update_rating
  end

end
