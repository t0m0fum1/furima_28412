class BuysController < ApplicationController
  
  def new
    @buy = Buy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @buy = Buy.new(buy_params)
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
    params.permit(:token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: buy_params[],
      card: buy_params[:token],
      currency:'jpy'
    )
  end



end
