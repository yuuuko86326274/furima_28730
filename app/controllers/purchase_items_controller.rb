class PurchaseItemsController < ApplicationController
  before_action :move_to_login
  before_action :item_id_search
  before_action :purchase_user_sell

  def index
    @transaction = Transactions.new
  end

  def create
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

  def item_id_search
    @item = Item.find(params[:item_id])
  end

  def purchase_user_sell
    redirect_to root_path if @item.purchase_item.present? || current_user.id == @item.user_id
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
