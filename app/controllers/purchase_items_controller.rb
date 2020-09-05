class PurchaseItemsController < ApplicationController
  before_action :move_to_login

  def index
    @item = Item.find(params[:item_id])
    @transaction = Transactions.new
  end

  def create
    @item = Item.find(params[:item_id])
    @transaction = Transactions.new(purchase_params)
    if @transaction.valid?
      @transaction.save
      pay_item
      return redirect_to root_path
    end
    render 'index'
  end

  private

  def move_to_login
    redirect_to new_item_path unless user_signed_in?
  end

  def purchase_params
    params.permit(
      :postal_code,
      :delivery_area_id,
      :city,
      :address_num,
      :building_name,
      :tel,
      :token
    )
          .merge(user_id: current_user.id)
          .merge(item_id: @item.id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end
end
