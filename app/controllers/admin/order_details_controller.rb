class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    @order_details = @order.order_details
    @order_detail.update(order_detail_params)
     if @order_details.count == @order_details.where(production_progress: 3).count
       @order.update(order_progress: 3)
     end
    redirect_to admin_order_path(@order.id)
  end

  private
  def order_detail_params
   params.require(:order_detail).permit(:production_progress, :item_id, :order_id, :price, :amount)
  end
end
