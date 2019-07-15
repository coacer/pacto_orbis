class Genre < ApplicationRecord
  has_many :items
  validates :name, presence: true
end
