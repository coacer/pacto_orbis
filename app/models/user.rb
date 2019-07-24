class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable

  before_validation :set_address
  attr_accessor :prefecture_name, :city, :street

  validates :first_name, presence: true, length: { maximum: 15 }, format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/ }
  validates :last_name, presence: true, length: { maximum: 15 }, format: { with: /\A\p{blank}*[^\p{katakana}\p{blank}ｧ-ﾝﾞﾟ]+\p{blank}*\z/}
  validates :kana_first_name, presence: true, length: { maximum: 15 }, format: { with: /\A\p{blank}*[\p{katakana}ー]+\p{blank}*\z/ }
  validates :kana_last_name, presence: true, length: { maximum: 15 }, format: { with: /\A\p{blank}*[\p{katakana}ー]+\p{blank}*\z/ }
  validates :phone, presence: true, length: { in: 10..11 }, numericality: { only_integer: true }
  validates :postal_code, presence: true, length: { in: 5..9 }, format: { with: /\A\w+\z/ }
  validates :address, presence: true
  validates :prefecture_name, presence: true
  validates :city, presence: true
  validates :street, presence: true

  def read_postal_code
    postal_code[0, 3] + "-" + postal_code[3, 4]
  end

  def status
    is_deleted ? "退会済み" : "利用中"
  end

  def full_name
    "#{last_name} #{first_name}"
  end

  def kana_full_name
    "#{kana_last_name} #{kana_first_name}"
  end

  def active_for_authentication?
    super && !(self.is_deleted)
  end

  def inactive_message
    !(self.is_deleted) ? super : :unsubscribed
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
