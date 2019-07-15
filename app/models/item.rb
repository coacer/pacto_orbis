class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
  attachment :jacket_image
  
  validates :title, presence: true
  validates :price, presence: true
  validates :stock, presence: true

end
