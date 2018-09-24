class LineItemsController < ApplicationController

  def create # adding to cart
    # Check if both parameters exist
    if params[:product_name].blank? || params[:order_id].blank?
      render json: { error: "Please provide both product_name and order_id" } and return
    end

    # Find Product
    product = Product.find_by_name(params[:product_name])
    if product.blank?
      render json: { error: "Product not found" } and return
    end

    # Find Order
    order = Order.find(params[:order_id])
    if order.blank?
      render json: { error: "Order not found" } and return
    end

    line_item_params = {
      product_id: product.id,
      order_id: order.id,
      price: product.price,
      product_name: product.name
    }
    @line_item = LineItem.create(line_item_params)
    render json: @line_item
  end

  def show
    line_item_id = params[:id]

    if LineItem.exists?(id: line_item_id)
      @line_item = LineItem.find(line_item_id)
      render json: @line_item
    else
      render json: { error: "No line_item with that ID" }
    end
  end

  def update
    # Check if both parameters exist
    if params[:product_name].blank? || params[:order_id].blank? || params[:price].blank?
      render json: { error: "Please provide product_name, order_id and price" } and return
    end

    # Find Product
    product = Product.find_by_name(params[:product_name])
    if product.blank?
      render json: { error: "Product not found" } and return
    end

    # Find Order
    order = Order.find(params[:order_id])
    if order.blank?
      render json: { error: "Order not found" } and return
    end

    line_item_id = params[:id]

    if LineItem.exists?(id: line_item_id)
      @line_item = LineItem.find(line_item_id)
      line_item_params = {
        price: params[:price],
        product_name: params[:product_name]
      }
      @line_item.update(line_item_params)
      render json: @line_item
    else
      render json: { error: "No line_item with that ID" }
    end

  end

  def destroy
    line_item_id = params[:id]

    if LineItem.exists?(id: line_item_id)
      @line_item = LineItem.find(line_item_id)
      @line_item.delete
      render json: @line_item
    else
      render json: { error: "No line_item with that ID" }
    end
  end

  def index
    @line_items = LineItem.all
    render json: @line_items
  end
end
