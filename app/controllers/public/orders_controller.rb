class Public::OrdersController < ApplicationController



  def new
   @order = Order.new
   @cart_items = current_customer.cart_items
   @total_price = 0

    if @cart_items.empty?
     redirect_to cart_items_path
    end

  end

  def check
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.last_name + current_customer.first_name
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @total_price = 0
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.shipping_cost = 800
    @cart_items = current_customer.cart_items
    @order.total_payment = @order.shipping_cost + @cart_items.sum(&:subtotal)
    @order.save!
    @cart_items.each do |cart_item|
      @order_detail = OrderDetail.new
      @order_detail.item_id = cart_item.item_id
      @order_detail.order_id = @order.id
      @order_detail.amount = cart_item.amount
      @order_detail.unit_price = cart_item.item.price*1.1
      @order_detail.save!
    end

    redirect_to done_path
      current_customer.cart_items.destroy_all

  end

  def update

  end
  def done

  end

  def index
    @orders = current_customer.orders
  end

  def show
    @order = current_customer.orders.find(params[:id])
    #@order = Order.find(params[:id])
    @order_details = @order.order_details
    @total_price = 0
  end
  private

  def order_params
    params.require(:order).permit(:name, :postal_code, :address, :payment_method)
  end

end
