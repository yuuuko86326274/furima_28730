class PurchaseItemsController < ApplicationController
  before_action :move_to_login
  
  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @address = Address.create(address_params)

    @purchase_item = PurchaseItem.create(order_params)
    if @purchase_item.valid?
      pay_item
      @purchase_item.save
      return redirect_to root_path
    end
    render 'index'
  end


  private

  def move_to_login
    redirect_to new_item_path unless user_signed_in?
  end

  def address_params
    params.require(:address).permit(
      :postal_code,
      :delivery_area_id,
      :city,
      :address_num,
      :building_name,
      :tel)
  end

  def order_params
    params.require(:item
    ).permit(:price, :token
    ).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
