class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
  @items = Item.all.order("created_at DESC")

  private

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
