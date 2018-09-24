# ShopifyCodingChallenge
:D

Hey there! So here is my implmentation for the Shopify Coding Challenge!

To get the API up and running you'll have to clone this directory, ```git@github.com:JamesZhaoLu/ShopifyCodingChallenge.git``` and use ```bin/rails server``` to get the API up and running

From there you can visit this [link](https://documenter.getpostman.com/view/3569996/RWaPtkqL) for documentation on how the API works! Though here is a *brief* overview:
- To "create a new cart with a store" - create an order using the URL: localhost:3000/orders?shop_name=
- To "add items to the cart" - you should create a new Line Item using the URL: localhost:3000/line_items?product_name=order_id=
- To "checkout" - you can update the order. This action recalculates the total cost of all the line_items. Use the URL: localhost:3000/orders?shop_names=&line_items_names=


Thanks for giving me this challenge; I really was exciting and there is still much more that I want to implement such as a more friendly UX (using names instead of ids) and additional security though for the time being, this was fun!

