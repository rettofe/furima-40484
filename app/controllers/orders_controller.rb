class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_item, only: [:new, :create, :index]
  before_action :check_if_sold, only: [:new, :create]

  def index
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @orders = @item.orders
  end

  def new
    @order_shipping = OrderShipping.new
  end

  def create
    @order_shipping = OrderShipping.new(order_shipping_params)
    if @order_shipping.valid?
      pay_item
      @order_shipping.save
      redirect_to root_path
    else
      gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def check_if_sold
    if @item.sold? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end
  def order_shipping_params
    params.require(:order_shipping).permit(:post_number, :shipping_source_id, :city, :street, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]    
    token = order_shipping_params[:token]

    Payjp::Charge.create(
      amount: @item.price,
      card: token,
      currency: 'jpy'
    )
  end

end