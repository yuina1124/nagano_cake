class Public::OrdersController < ApplicationController

  def create
    @order = Order.new
    @order.save
    redirect_to  orders_comfirmation_path
  end

  def comfirmation
    @order = Order.new
    @order.save
    redirect_to orders_completion_path
  end

end
