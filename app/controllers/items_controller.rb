class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update]
  # 購入機能実装後に確認すること
  #before_action :soldout_to_edit, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
        redirect_to item_path
      else
        render :edit
      end
  end

  private
    def item_params
      params.require(:item).permit(:image, :name, :category_id, :state_id, :province_id, :souryou_id, :day_id, :price, :comment).merge(user_id: current_user.id)
    end

    def move_to_index
      @item = Item.find(params[:id])
      unless current_user.id == @item.user_id
        redirect_to root_path
      end
    end
    
    def set_item
      @item = Item.find(params[:id])
    end
    
    #購入機能実装後に確認
    #def soldout_to_edit
      #@item = Item.find(params[:id])
      #unless buyer_id.empty?
        #redirect_to root_path
      #end
    #end
end

