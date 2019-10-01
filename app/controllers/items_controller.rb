class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(params_new)
  end

  def edit
    render layout: 'application.user'

  end


  def show
  end



  private
  def params_new
    params.require(:item).permit(:title, :description, :category_id, :brand_id, :status, :size_id, :region, :shipping_fee_burden, :shipping_method, :region, :shipping_duration, :price, images_attributes: [:image])
  end

end
