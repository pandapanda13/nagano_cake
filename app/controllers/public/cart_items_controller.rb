class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end

  def empty
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end

  privete cart_item_params
   params.require(:cart_item).permit(:amount, :item_id)
end
