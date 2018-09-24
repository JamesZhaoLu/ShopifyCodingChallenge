class Order < ApplicationRecord
  belongs_to :shop
  has_many :line_items

  def self.find_total_price(line_items_names)
  	total_price = 0
  	line_items_names.each do |line_item_name|
  	  line_item = LineItem.find_by_product_name(line_item_name)
      return -1 if line_item.blank?

  	  total_price += line_item.price
  	end
  	return total_price
  end
end
