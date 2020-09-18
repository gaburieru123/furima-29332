class ItemsController < ApplicationController

  before_action :move_to_index, except: [:index, :show]

  def index
    @Item = Item.all
  end

  def new
    @Item = Item.new
  end

  def create
    Item.create
  end

  private

  def item_paramas
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end




  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  
end
