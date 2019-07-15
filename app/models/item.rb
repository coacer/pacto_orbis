class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  has_many :disks
  attachment :jacket_image
  
  validates :title, presence: true
  validates :price, presence: true, numericality: { only_integer: true }
  validates :stock, presence: true, numericality: { only_integer: true }

end
