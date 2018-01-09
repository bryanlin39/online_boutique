class Product < ApplicationRecord

  has_many :reviews

  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }, allow_nil: true

  # Paperclip image attachment
  has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  def update_rating
    total = 0
    number_of_reviews = self.reviews.count
    self.reviews.each { |review| total += review.rating }
    average = total/number_of_reviews
    self.rating = average
    self.save
  end

end
