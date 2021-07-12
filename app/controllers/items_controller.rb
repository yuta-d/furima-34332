class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, except: [:index, :show]
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

  def edit
    @item = Item.find(params[:id])
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
       redirect_to root_path
    else
       render :edit
    end
  end



  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :quality_id, :delivaliy_cost_id, :delivaliy_day_id, :description, :price, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
