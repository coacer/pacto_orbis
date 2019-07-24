class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_many :disks, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  attachment :jacket_image
  accepts_nested_attributes_for :disks, reject_if: :all_blank, allow_destroy: true
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :stock, presence: true, numericality: { only_integer: true }

end
