class Address < ApplicationRecord
  belongs_to :user

  before_validation :set_address
  attr_accessor :prefecture_name, :city, :street

  validates :name, presence: true, length: { maximum: 30 }
  validates :postal_code, presence: true, length: { in: 5..9 }, format: { with: /\A\w+\z/ }
  validates :address, presence: true
  validates :prefecture_name, presence: true
  validates :city, presence: true
  validates :street, presence: true

  def read_postal_code
    postal_code[0, 3] + "-" + postal_code[3, 4]
  end

  def prefecture_name
    @prefecture_name || self.address.split[0] if self.address.present?
  end

  def city
    @city || self.address.split[1] if self.address.present?
  end

  def street
    @street || self.address.split[2] if self.address.present?
  end

  def set_address
    self.address = [@prefecture_name, @city, @street].join(' ')
  end
end
