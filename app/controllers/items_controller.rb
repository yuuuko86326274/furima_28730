class ItemsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :find_id, except: [:index, :new, :create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def create
    @items = Item.create(item_params)
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render 'show'
    end
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_id
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :item_text,
      :price,
      :category_id,
      :item_status_id,
      :delivery_burden_id,
      :delivery_area_id,
      :delivery_days_id,
      images:[]
    ).merge(user_id: current_user.id)
  end
end
