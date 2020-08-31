class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)

    if @items.valid?
      @items.save  # バリデーションをクリアした時
      return redirect_to root_path
    else
      render "new"    # バリデーションに弾かれた時
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def item_params
    params.require(:item).permit(:image,:name,:item_text,:price,:category_id,:item_status_id,:delivery_burden_id,:delivery_area_id,:delivery_days_id).merge(user_id: current_user.id)
  end
end
