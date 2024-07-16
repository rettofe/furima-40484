class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
   end
  def create
    @item = Item.new(item_params)
    if @item.save
    redirect_to @item
  else
    render :new
   end
  end
   def new
    @item = Item.new
   end
end

private

def item_params
  params.require(:item).permit(:title,:description,:price,:image,:category_id,:condition_id,:delivery_charge_id,:shipping_day_id,:shipping_source_id)
end