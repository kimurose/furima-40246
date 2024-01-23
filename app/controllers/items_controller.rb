class ItemsController < ApplicationController
  def index
    @items = Item.includes(:user)
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:product_name, :explanation, :category_id, :condition_id, :delivery_cost_id, :prefecture_id, :shipping_day_id, :price, :user_id)
  end
end
