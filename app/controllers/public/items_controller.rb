class Public::ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @items = Item.all.page(params[:page]).per(8).order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem
  end

  private
  def item_params
   params.require(:item).permit(:genre_id, :name,:introduction,:image_id,:price)
  end
end
