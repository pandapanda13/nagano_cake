class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  def show
   @order = Order.find(params[:id])
   @order_details = @order.order_details
  end

  def update
   @order = Order.find(params[:id])
   @order.update(order_params)
   @order_details = @order.order_details
    if @order.order_progress == "paid"
     @order_details.each do |order_detail|
      order_detail.update(production_progress: 1)
     end
    end
   redirect_to admin_order_path(@order.id)
  end

  private
  def order_params
   params.require(:order).permit(:order_progress, :postal_code, :address, :name, :payment, :bill, :total)
  end
end
