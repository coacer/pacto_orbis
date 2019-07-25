class Item < ApplicationRecord
  before_save { self.status = stock == 0 ? false : true }
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_many :disks, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy

  attachment :jacket_image
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :stock, presence: true, numericality: { only_integer: true }

  def stock_array
    [*1..stock]  # 1からstockの数まで連番の配列を返す
  end

  def stock_and_cart_array
    num = stock + cart_items.first.amount
    [*1..num]  # 1からstock + カートにある枚数の数まで連番の配列を返す
  end

  def add_stock(amount)
    self.stock = stock + amount
    save!
  end

  def reduce_stock(amount)
    self.stock = stock - amount
    save!
  end

  def added_to_cart_by?(user)
    cart_items.where(user_id: user.id).present?
  end

  def cart_item_by(user)
    cart_items.find_by(user_id: user.id)
  end
end
