class ItemsController < ApplicationController
  def index
    
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirecred_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:category_id,:status_id,:ship_method_id,:area_id,:ship_date_id,:name,:price,:explanation,:category_id,:status_id,:method_id,:area_id,:date_id,:user,:image).merge(user_id: current_user.id)
  end
end
