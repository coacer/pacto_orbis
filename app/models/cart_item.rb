class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :item
end
