class ProductsController < ApplicationController

  def create
    # Check if both parameters exist
    if params[:shop_name].blank? || params[:name].blank? || params[:price].blank?
      render json: { error: "Please provide both a shop_name, name and an price" } and return
    end

    # Find Shop
    shop = Shop.find_by_name(params[:shop_name])

    if shop.blank?
      render json: { error: "Shop not found" } and return
    end

    product_params = {
      shop_id: shop.id,
      name: params[:name],
      price: params[:price],
      quantity: params[:quantity] || 0
    }
    if Product.exists?({name: params[:name]})
      render json: { error: "This product Already Exists" } and return
    else
      @product = Product.create(product_params)
      render json: @product
    end
  end

  def show
    product_id = params[:id]

    if Product.exists?(id: product_id)
      @product = Product.find(product_id)
      render json: @product
    else
      render json: { error: "No product with that ID" }
    end
  end

  def update
    # Check if both parameters exist
    if params[:shop_name].blank? || params[:name].blank? || params[:price].blank?
      render json: { error: "Please provide both a shop_name, name and an price" } and return
    end

    # Find Shop
    shop = Shop.find_by_name(params[:shop_name])

    if shop.blank?
      render json: { error: "Shop not found" } and return
    end

    product_id = params[:id]

    if Product.exists?(id: product_id, shop_id: shop.id)
      @product = Product.find(product_id)
      # Can be updated through a Form
      product_params = {
        name: params[:name],
        price: params[:price],
        quantity: params[:quantity] || 0
      }
      @product.update(product_params)
      render json: @product
    else
      render json: { error: "No product with that ID" }
    end

  end

  def destroy
    product_id = params[:id]

    if Product.exists?(id: product_id)
      @product = Product.find(product_id)
      @product.delete
      render json: @product
    else
      render json: { error: "No product with that ID" }
    end
  end

  def index
    @products = Product.all
    render json: @products
  end

end
