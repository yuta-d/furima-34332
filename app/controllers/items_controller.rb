class ItemsController < ApplicationController
  before_action :authenticate_user!, only: new
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
       redirect_to root_path
    else
       render :new
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :quality_id, :delivaliy_cost_id, :delivaliy_day_id, :description, :price, :prefecture_id).merge(user_id: current_user.id)
  end
end
