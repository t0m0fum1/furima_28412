class ItemsController < ApplicationController
  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :status_id, :burden_id, :shipping_origin_id, :day_id, :fee, :name, :explain).merge(user_id: current_user.id)
  end
end
