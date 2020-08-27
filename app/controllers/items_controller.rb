class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def item_params
    params.require(:item).permit(:image, :name, :item_text)
end
