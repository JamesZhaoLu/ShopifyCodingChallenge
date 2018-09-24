class ShopsController < ApplicationController

	def create
    # Check if both parameters exist
    if params[:name].blank? || params[:owner].blank?
      render json: { error: "Please provide both a name and an owner" } and return
    end

    shop_params = {
      name: params[:name],
      owner: params[:owner]
    }
    if Shop.exists?(shop_params)
      render json: { error: "This Shop Already Exists" } and return
    else
      @shop = Shop.create(shop_params)
      render json: @shop
    end
  end

  def show
    shop_id = params[:id]

    if Shop.exists?(id: shop_id)
      @shop = Shop.find(shop_id)
      render json: @shop
    else
      render json: { error: "No Shop with that ID" }
    end
  end

  def update
    # Check if both parameters exist
    if params[:name].blank? || params[:owner].blank?
      render json: { error: "Please provide both a name and an owner" } and return
    end

    shop_id = params[:id]

    if Shop.exists?(id: shop_id)
      @shop = Shop.find(shop_id)
      # Can be updated through a Form
      shop_params = {
        name: params[:name],
        owner: params[:owner]
      }
      @shop.update(shop_params)
      render json: @shop
    else
      render json: { error: "No Shop with that ID" }
    end

  end

  def destroy
    shop_id = params[:id]

    if Shop.exists?(id: shop_id)
      @shop = Shop.find(shop_id)
      @shop.delete
      render json: @shop
    else
      render json: { error: "No Shop with that ID" }
    end
  end

  def index
    @shops = Shop.all
    render json: @shops
  end

  def products
    if Shop.exists?(id: params[:id])
      # Obtain Shop
      shop = Shop.find(params[:id])
      @products = shop.products
      render json: @products
    else
      render json: { error: "Could not find shop"}
    end
  end

  def orders
    if Shop.exists?(id: params[:id])
      # Obtain Shop
      shop = Shop.find(params[:id])
      @orders = shop.orders
      render json: @orders
    else
      render json: { error: "Could not find shop"}
    end
  end
end
