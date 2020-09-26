class OrdersController < ApplicationController
  before_action :move_to_index, only: [:index]

  def index
    # @orders = Order.find(order_params)
  end

  private
  def order_params
    params.permit(:post_code, :prefecture, :city, :house_number, :building_name, :phone_number, :item_purchase_id).merge(user_id: current_user.id, item_id: params[:item_purchase_id])
  end

  def  move_to_index
    unless user_signed_in?
      redirect_to :new_user_session
    end
  end

end
