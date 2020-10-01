class OrdersController < ApplicationController
  before_action :move_to_session, only: [:index]#未ログイン時に購入ボタン押すとログイン画面へ移動させる。
  before_action :set_item, only: [:index, :create]

  def index
    
    @credit_address = CreditAddress.new
  end
  
  def create  
    @credit_address = CreditAddress.new(order_params)
    if @credit_address.valid?
      pay_item
      @credit_address.save
      return redirect_to root_path
    else
      # set_itemが発動
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token, :item_id, :post_code, :delivery_area_id, :city, :house_number, :building_name, :phone_number, :item_purchase_id).merge(user_id: current_user.id)
    # paemit（:token)は、card.jsファイルのconst tokenObjのname='token'のこと。const tokenObj = `<input value=${token} type="hidden" name='token'>`;　
  end

  #未ログイン時に購入ボタン押すとログイン画面へ移動させる。
  def  move_to_session
    unless user_signed_in?
      redirect_to :new_user_session
    end
  end
  #未ログイン時に購入ボタン押すとログイン画面へ移動させる。
  
  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ""  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def user_item
    
  end
  def set_item
    @item = Item.find(params[:item_id])
  end

  def 


end