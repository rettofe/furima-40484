class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    #@items = Item.order("created_at DESC")
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


  private

  def item_params
  params.require(:item).permit(:title,:description,:price,:image,:category_id,:condition_id,:delivery_charge_id,:shipping_day_id,:shipping_source_id).merge(user_id: current_user.id)
  end
end