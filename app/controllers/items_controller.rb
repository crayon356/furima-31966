class ItemsController < ApplicationController
  def index
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

  private
    def item_params
      params.require(:item).permit(:image, :name, :category_id, :state_id, :province_id, :souryou_id, :day_id, :price, :comment).merge(user_id: current_user.id)
    end
end

