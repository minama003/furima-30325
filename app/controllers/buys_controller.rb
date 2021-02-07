class BuysController < ApplicationController
  def index
    @shipping_addesses_buy = ShippingAddressBuy.new
    @item = Item.find(params[:item_id])
  end

  def create
    @shipping_addesses_buy = ShippingAddressBuy.new(buy_params) 
     if @shipping_addesses_buy.valid?
       @shipping_addesses_buy.save
       redirect_to action: :index
     else
       render action: :new
     end
  end

  def buy_params
    params.require(:shipping_addesses_buy).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
   end
end
