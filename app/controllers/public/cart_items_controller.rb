class Public::CartItemsController < ApplicationController
  def index
    @cart_items = CartItem.all


  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def empty
    @cart_items = current_customer.cart_items
    @cart_items.destroy_all
    redirect_to cart_items_path
  end



  def create
    cart_item = CartItem.new(cart_item_params)
    # item = Item.find(params[:item_id])
    cart_item.customer_id = current_customer.id
    cart_item.save
    redirect_to cart_items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:amount, :item_id, :item_name, :item_price )
  end
end
