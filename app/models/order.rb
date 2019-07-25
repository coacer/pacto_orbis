class Order < ApplicationRecord
  belongs_to :user
  has_many :order_details, dependent: :destroy

  validates :total_price, presence: true
  validates :payment, presence: true
  validates :status, presence: true
  validates :postal_code, presence: true, length: { in: 5..9 }, format: { with: /\A\w+\z/ }
  validates :address, presence: true
  validates :delivery_cost, presence: true
end
