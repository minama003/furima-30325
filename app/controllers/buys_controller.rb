class BuysController < ApplicationController
  def index
    @address_buy = AddressBuy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @address_buy = AddressBuy.new(buy_params)
    if @address_buy.valid?
      pay_item
      @address_buy.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buy_params
    params.require(:address_buy).permit(
      :post_code,
      :prefecture_id,
      :city,
      :house_number,
      :building_name,
      :phone_number
    ).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
