class Product < ApplicationRecord
  belongs_to :shop
  has_many :line_items
  validates :name, presence: true, uniqueness: { scope: :shop_id }
  validates :quantity, presence: true
  validates :price, presence: true
end
