class Public::HomesController < ApplicationController
  def top
   @items = Item.all

  end

  def about
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :image)
  end

end
