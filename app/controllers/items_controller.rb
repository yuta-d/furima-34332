class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :quality_id, :delivaliy_cost_id, :delivaliy_day_id, :description, :price, :prefecture_id).merge(user_id: current_user.id)
end
