class BuysController < ApplicationController
  def new
    @item = Item.find(params[:item_id])
    redirect_to root_path if user_signed_in? && current_user.id == @item.user_id

    redirect_to root_path if Buy.exists?(item_id: @item.id.to_s)
  end

  def create
    @buy = UserBuy.new(buy_params)
    if @buy.valid?
      pay_item
      @buy.save
      redirect_to root_path
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
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.fee,
      card: params[:token],
      currency: 'jpy'
    )
  end
end
