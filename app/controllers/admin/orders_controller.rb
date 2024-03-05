class Admin::OrdersController < ApplicationController
  def show
    @orders = Order.all
    @order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0


  end

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method)
  end
end