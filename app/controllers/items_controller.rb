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

  def destroy
    item = Item.find(params[:id])
    item.destroy
    if item.destroy
      redirect_to root_path
    else
      render :show
  end

  def edit
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:image, :category_id, :status_id, :burden_id, :shipping_origin_id, :day_id, :fee, :name, :explain).merge(user_id: current_user.id)
  end
end
