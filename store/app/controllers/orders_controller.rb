class OrdersController < ApplicationController

	def create # start a new order
    # Check if both parameters exist
    if params[:shop_name].blank?
      render json: { error: "Please provide both shop_name" } and return
    end

    # Find Shop
    shop = Shop.find_by_name(params[:shop_name])
    if shop.blank?
      render json: { error: "Shop not found" } and return
    end

    order_params = {
      shop_id: shop.id,
      total_price: 0,
    }
    @order = Order.create(order_params)
    render json: @order
  end

  def show
    order_id = params[:id]

    if Order.exists?(id: order_id)
      @order = Order.find(order_id)
      render json: @order
    else
      render json: { error: "No order with that ID" }
    end
  end

  def update # checkout
    # Check if both parameters exist
    if params[:shop_name].blank? || params[:line_items_names].blank?
      render json: { error: "Please provide both shop_name and line items" } and return
    end

    # Find Shop
    shop = Shop.find_by_name(params[:shop_name])

    if shop.blank?
      render json: { error: "Shop not found" } and return
    end

    order_id = params[:id]

    # Find Line Items and calculate total price
    total_price = Order.find_total_price(params[:line_items_names])
    render json: { error: "Cannot find an item in your cart" } and return if total_price == -1

    if Order.exists?(id: order_id, shop_id: shop.id)
      @order = Order.find(order_id)
      # Can be updated through a Form
      order_params = {
        total_price: total_price,
      }
      @order.update(order_params)
      render json: @order
    else
      render json: { error: "No order with that ID" }
    end

  end

  def destroy
    order_id = params[:id]

    if Order.exists?(id: order_id)
      @order = Order.find(order_id)
      @order.delete
      render json: @order
    else
      render json: { error: "No order with that ID" }
    end
  end

  def index
    @orders = Order.all
    render json: @orders
  end
end
