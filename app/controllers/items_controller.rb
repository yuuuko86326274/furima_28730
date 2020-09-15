class ItemsController < ApplicationController
  before_action :move_to_index, except: %i[index show]
  before_action :find_id, except: %i[index new create]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @items_tag = ItemsTag.new
  end

  def create
    @items_tag = ItemsTag.new(item_params)
    if @items_tag.valid?
      @items_tag.save
      return redirect_to root_path
    else
    render 'new'
    end
  end

  def edit
  end

  def update
    # binding.pry
    #@items_tag = ItemsTag#.new(item_update_params)
    if @items_tag.valid?
      @items_tag.update(item_update_params)
      return redirect_to root_path
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

  def search
    return nil if params[:input] == ""
    tag = Tag.where(['tag_name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
  end

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  def find_id
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:items_tag).permit(
      :tag_name,
      :name,
      :item_text,
      :price,
      :category_id,
      :item_status_id,
      :delivery_burden_id,
      :delivery_area_id,
      :delivery_days_id,
      images: []
    ).merge(user_id: current_user.id)
  end
  def item_update_params
    params.require(:item).permit(
      :tag_name,
      :name,
      :item_text,
      :price,
      :category_id,
      :item_status_id,
      :delivery_burden_id,
      :delivery_area_id,
      :delivery_days_id,
      images: []
    ).merge(user_id: current_user.id, id: params[:id] )
  end
end
