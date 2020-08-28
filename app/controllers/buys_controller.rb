class BuysController < ApplicationController
  
  def new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy = UserBuy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      return redirect_to root_path
    else
      render 'new'
    end
  end
  

  private

  def buy_params
    params.permit(:item_id, :token, :prefecture_id, :postal_code, :city, :address, :building_name, :tel).merge(user_id: current_user.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.fee,
      card: params[:token],
      currency:'jpy'
    )
  end



end
