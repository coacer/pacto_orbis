class OrderDetail < ApplicationRecord
  belongs_to :item
  belongs_to :order

  validates :cd_amount, presence: true
  validates :cd_price, presence: true
end
