class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  validates :total_price, presence: true
  validates :payment, presence: true
  validates :status, presence: true
  validates :postal_code, presence: true, length: { in: 5..9 }, format: { with: /\A\w+\z/ }
  validates :address, presence: true
  validates :delivery_cost, presence: true

  enum payment: { cash: 0, bank: 1 }
  enum status: { receipt: 0, preparation: 1, shipped: 2 }
end
