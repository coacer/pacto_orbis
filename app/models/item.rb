class Item < ApplicationRecord
  belongs_to :artist
  belongs_to :label
  belongs_to :genre
end
