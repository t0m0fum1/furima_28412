class ItemsController < ApplicationController
  
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def edit
  end

  def show
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain).merge(user_id: current_user.id)
  end

end
