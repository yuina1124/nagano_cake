class Public::CartItemsController < ApplicationController

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if current_customer.cart_items.where(item_id: @cart_item.item_id).size != 0
      @item = current_customer.cart_items.find_by(item_id: @cart_item.item_id)
      @item.update_column(:amount,(@cart_item.amount+@item.amount))
    else
      @cart_item.item_id
      @cart_item.save
    end
    redirect_to cart_items_path
  end

  def show
  end

  def index
    @cart_items = CartItem.all
    @total = 0
  end

  def destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :amount)
  end

end
