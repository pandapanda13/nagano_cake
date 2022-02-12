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
      @address = Address.find(params[:order][:address_1])
      @order.postal_code = @address.postal_code
      @order.address = @address.address
      @order.name = @address.name
    elsif params[:order][:address_list]  == "3"
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
    order.save
    redirect_to orders_thanks_path

  end


  def thanks
  end



  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :name, :payment)
  end

  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
