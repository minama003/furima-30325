class ItemsController < ApplicationController
  def index
  end


  private
  def message_params
    params.require(:item).permit(:name,:text,:category_id,:condition_id,:delivery_charge_id,:delivery_day_id,:prefecture_id,:price,:image).merge(user_id: current_user.id)
  end
end
