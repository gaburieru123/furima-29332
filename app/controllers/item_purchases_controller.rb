class ItemPurchasesController < ApplicationController

  def create
    ItemPurchase.create(itemPurchase_params)
  end


  private
  
  def itemPurchase_params
    params.require(:itempurchase).permit(:user_id, :item_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  
end
