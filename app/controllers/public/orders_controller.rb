class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!

  def new
    @order = Order.new
    @addresses = current_customer.addresses
  end

  def confirm
   params[:order][:payment] = params[:order][:payment].to_i
   @order = Order.new(order_params)
   @cart_items = current_customer.cart_items
    if params[:order][:address_list] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_list]  == "1"
      @address = Address.find(params[:order][:address_list_1])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_list]  == "2"
      address_new = Address.new(address_params)
      address_new.customer_id = current_customer.id
      address_new.save
      @order.postal_code = address_new.postal_code
      @order.address = address_new.address
      @order.name = address_new.name
    else
    @addresses = current_customer.addresses
     render :new
    end
  end

  def create
    cart_items = current_customer.cart_items
    # @order = current_customer.orders.new (order_params)
    @order = Order.new (order_params)
   # @order.total = params[:order][:total]
    @order.bill = params[:order][:bill]
    @order.customer_id = current_customer.id
    @order.shipping_fee = 800
    if @order.save!
     cart_items.each do |cart_item|
       @order_detail = OrderDetail.new
       @order_detail.item_id = cart_item.item_id
       @order_detail.order_id = @order.id
       @order_detail.amount = cart_item.amount
       @order_detail.price = cart_item.item.price
       @order_detail.save
     end
     redirect_to orders_thanks_path
     cart_items.destroy_all
    else
      @order = Order.new(order_params)
      render :new
    end
  end


  def thanks
  end

  def index
    @orders = current_customer.orders.all.order(created_at: :desc)
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment, :bill, :total)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
