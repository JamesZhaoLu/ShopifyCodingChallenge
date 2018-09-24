namespace :setup do
  desc "TODO"

  # Run with bin/rake setup:populate_db
  task populate_db: :environment do
  	# Create new shop(s)
    shop1 = Shop.first_or_create(name: "Joe's Online Convenience", owner: "James")

    # Create new product(s)
    coffee = Product.create(price: 5.05, name: "Coffee")
    chocolate = Product.create(price: 3.02, name: "Chocolate Bar")
    shop1.products << coffee
    shop1.products << chocolate

    # Create new line item(s)
    coffee_line_item = LineItem.first_or_create(price: coffee.price)
    chocolate_line_item = LineItem.first_or_create(price: chocolate.price)

    # Add Line Items to Products
    coffee.line_items << coffee_line_item
    chocolate.line_items << chocolate_line_item

    # Create new order(s)
    order1 = Order.create(total_price: coffee_line_item.price + chocolate_line_item.price)
    order2 = Order.create(total_price: coffee_line_item.price)
    order1.line_items << coffee_line_item
    order1.line_items << chocolate_line_item
    order2.line_items << coffee_line_item

    shop1.orders << order1
    shop1.orders << order2
  end

end
