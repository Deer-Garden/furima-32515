class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    # binding.pry
    @user_order = UserOrder.new(order_params)
    if @user_order.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: Item.find(params[:item_id]).price, 
        card: order_params[:token], 
        currency: 'jpy' 
      )
      @user_order.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render action: :index
    end
  end

  private

  def order_params
    params.require(:user_order).permit(:postal_code, :prefecture, :city, :street, :build, :phone, :user_order, :commit).merge(token: params[:token] , user_id: current_user)
  end
end