class Account < ApplicationRecord

  belongs_to :user
  has_many :reviews
  has_many :orders

end
