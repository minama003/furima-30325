class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    def create
      @item = Item.new(Item_params)
      if @item.save
        redirect_to root_path
      else
        render :new
      end
    end
  end


  private
  def message_params
    params.require(:item).permit(:name,:text,:category_id,:condition_id,:delivery_charge_id,:delivery_day_id,:prefecture_id,:price,:image).merge(user_id: current_user.id)
  end
end
