class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    # @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = current_user.items.build(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :items_name, :items_description, :category_info_id, :items_condition_id,
                                 :shipping_fee_burden_id, :prefecture_id, :shipping_day_id, :price)
  end
end
