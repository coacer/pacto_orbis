class Song < ApplicationRecord
  belongs_to :disk
  validates :title, presence: true
end
