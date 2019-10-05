class ItemsController < ApplicationController
  #開発中はコメントアウト デプロイ前に解除すること
  # before_action :authenticate_user!, except: :index
  
  layout 'application.users', except: [:index,:show]

  def index
  end

  def new
  
  end

  def create
    @item = Item.new(params_new)
  end

  def edit
   

  end


  def show
  end


  private
  def params_new
    params.require(:item).permit(:title, :description, :category_id, :brand_id, :status, :size_id, :region, :shipping_fee_burden, :shipping_method, :region, :shipping_duration, :price, images_attributes: [:image])
  end

  def buy
    
  end
end
