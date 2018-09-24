class AddProductNametoLineItems < ActiveRecord::Migration[5.2]
  def change
  	add_column :line_items, :product_name, :string
  end
end
