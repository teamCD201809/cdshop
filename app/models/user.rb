class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  acts_as_paranoid
  has_many :cart_items, dependent: :destroy
  has_many :orders
  has_many :delivery_addresses
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :address, presence: true
  validates :name_kana, presence: true, format: { with:/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/}
  validates :postal_code, presence: true, length: { is: 7}, numericality:{only_integer: true}
  validates :tel_number, presence: true, length: {minimum:7, maximum:11 }, numericality:{only_integer: true}
end
