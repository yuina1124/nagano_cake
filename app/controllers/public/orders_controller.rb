class Public::OrdersController < ApplicationController

  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to  orders_completion_path
  end

  def comfirmation
    @cart_items = current_customer.cart_items
    @order = Order.new
    @order.customer_id = current_customer.id
    @total = 0
    if params[:order][:addresses] =="0"
      @order.address = current_customer.address
      @order.postal_code = current_customer.postal_code
      @order.name = current_customer.last_name
      @order.name = current_customer.first_name
    elsif params[:order][:addresses] =="1"
      @order.address = Address.find(params[:order][:address_id]).address
      @order.postal_code = Address.find(params[:order][:address_id]).postal_code
      @order.name = Address.find(params[:order][:address_id]).name
    elsif params[:order][:addresses] =="2"
      @order.address = params[:order][:address]
      @order.postal_code = params[:order][:postal_code]
      @order.name = params[:order][:name]
    end
  end

  def new
    @order = Order.new
  end

  def index
    @orders = current_customer.orders
    @total = 0
    @cart_item = current_customer.cart_items
  end

  def show
    @order = current_customer.orders
    @orders = Order.all
    @orders = current_customer.orders
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :payment, :payment_method, :postage, :postal_code, :address, :name)
  end

end
