class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  layout 'application.users', except: [:index,:show]

  def index
  end

  def new
    render layout: 'application.users'
  end

  def create
    @item = Item.new(params_new)
  end

  def edit
    render layout: 'application.users'

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
