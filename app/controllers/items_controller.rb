class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_edit, only: [:edit, :update, :destroy]
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
  end

  def edit 
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end


  private

  def item_params
    params.require(:item).permit(:item_name, :category_id, :quality_id, :delivaliy_cost_id, :delivaliy_day_id, :description, :price, :prefecture_id, :image).merge(user_id: current_user.id)
  end

  def set_item
     @item = Item.find(params[:id])
  end

  def move_to_edit
    redirect_to root_path if current_user.id != @item.user_id || @item.purchase
  end
end
