class Public::CustomersController < ApplicationController
  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   customer = current_customer
   customer.update(customer_params)
   redirect_to customers_mypage_path(current_customer)
  end

  def unsubscribe
    @customer = current_customer

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_sessiom
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to new_customer_registration_path
  end

  private
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :emal)
  end
end
