class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def index
    #@items = Item.all
    @items = Item.page(params[:page])
  end

  def show
    @item = Item.find(params[:id])

  end

  def create
     item = Item.new(item_params)

     item.save

     redirect_to admin_item_path(item.id)
  end


  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path
  end

   def item_params
    params.require(:item).permit(:name, :introduction, :price, :image)
   end
end
