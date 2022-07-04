class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def show
    @cart_item = CartItem.new
    @item = Item.find(params[:id])
  end



  private

  def item_params
    params.require(:item).permit(:genres_id, :name, :introduction, :price, :is_active, :image)
  end

end
