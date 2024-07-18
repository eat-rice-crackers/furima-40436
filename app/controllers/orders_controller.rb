class OrdersController < ApplicationController
  before_action :set_item, only:[:index]

  def index
    @order_form = OrderForm.new
  end

  def create
    @order_form = OrderForm.new(order_form_params)
    if @order_form.valid?
      @order_form.save
      return redirect_to root_path
    else
      set_item
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_form_params
    params.require(:order_form).permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_if_sold_out_or_seller
    if current_user.nil?
      redirect_to new_user_session_path
    elsif @item.sold_out? || current_user.id == @item.user_id
      redirect_to root_path
    end
  end
end
