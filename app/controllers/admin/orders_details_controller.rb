class Admin::OrdersDetailsController < ApplicationController
  def create
    @order_detail = OrderDetail.new(order_detail_params)
  end

  def destroy

  end

  private

  def order_detail_params
    params.require(:order_detail).permit(:item_id, :order_id, :amount, :unit_price)
  end
end
