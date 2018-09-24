class Shop < ApplicationRecord
  has_many :products
  has_many :orders
  validates :name, presence: true, uniqueness: true
  validates :owner, presence: true, uniqueness: true

end
