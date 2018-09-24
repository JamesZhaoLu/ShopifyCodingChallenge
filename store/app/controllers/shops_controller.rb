class ShopsController < ApplicationController

	def create
  end

  def show
    id = params[:id]
    @shop = Shop.find(id)
    render json: @shop
  end

  def update
  end

  def destroy
  end

  def index
    @shops = Shop.all
    render json: @shops
  end

  private
    def shop_params
      # params.require[:shops]
    end
end
