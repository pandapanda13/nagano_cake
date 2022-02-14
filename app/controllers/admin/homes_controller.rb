class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  def top
    @orders = Order.all.page(params[:page]).per(10).order(created_at: :desc)
    @order_details = OrderDetail.all
    @instances = @orders | @order_details
   
  end

end
