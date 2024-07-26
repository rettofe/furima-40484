class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :correct_user,only: [:edit, :update, :destroy]
  def index
    @items = Item.order("created_at DESC")
   end
   def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
   end
  end
   def new
    @item = Item.new
   end
   def show
   end
   def edit
  end
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
   def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit,status: :unprocessable_entity
    end
  end

  private

  def item_params
  params.require(:item).permit(:title,:description,:price,:image,:category_id,:condition_id,:delivery_charge_id,:shipping_day_id,:shipping_source_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find(params[:id])
  end
  def correct_user
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end