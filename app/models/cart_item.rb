class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
  
  validate :item_stock_limit

  def item_stock_limit
    errors.add(:amount, " 分の在庫がありません もう一度枚数を選択し直してください") if amount > item.stock
  end
end
