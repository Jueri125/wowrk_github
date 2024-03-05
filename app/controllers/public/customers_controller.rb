class Public::CustomersController < ApplicationController


  def show
   @customer = current_customer
  end

  def edit
   @customer = current_customer
  end

  def update
   @customer = current_customer
   @customer.update(customer_params)
   redirect_to customers_my_page_path
  end

  def check

  end

  def withdrawal
   @customer = current_customer
   @customer.update(is_active: false, withdrawal_status: '退会')
   reset_session
   redirect_to public_path
  end

   private
  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
  end
end
