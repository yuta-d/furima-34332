class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @items = Item.all.order(created_at: :desc)
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

  def show
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :quality_id, :delivaliy_cost_id, :delivaliy_day_id, :description, :price, :prefecture_id, :image).merge(user_id: current_user.id)
  end
end
