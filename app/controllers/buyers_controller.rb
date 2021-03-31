class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :item_find, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :soldout_to_buy, only: [:index, :create]

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render "buyers/index"
    end
  end

  private
  def buyer_params
    params.require(:buyer_address).permit(:postal_code, :province_id, :city, :address, :building, :telephone).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def soldout_to_buy
    @buyer = Buyer.all
    @buyer.each do |buyer|  
      if buyer.item_id == @item.id
        redirect_to root_path
      end
    end
  end
end


