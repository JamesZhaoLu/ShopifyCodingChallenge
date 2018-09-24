class Shop < ApplicationRecord
  has_many :products
  has_many :orders
  validates :name, presence: true, uniqueness: { scope: :owner }
  validates :owner, presence: true

end
