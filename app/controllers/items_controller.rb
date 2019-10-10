class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  before_action :set_item
  layout 'application.users', except: [:index,:show]

  def index
    @items = Item.where()
    
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent = Category.where(ancestry: nil)
  end

  def create
    @item = Item.new(params_new)
    @item.images.build
    if @item.save
      redirect_to root_path
    else
      redirect_to new_item_path
    end
  end

  def edit

  end


  def show
    
  end

  def buy
    
  end

  def pay
    # Payjp の画面から取得した秘密鍵
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
      amount: 3500, # 決済する値段@item.price
      card: params['payjp-token'],
      currency: 'jpy'
    )
  end

  
  private
  
  def params_new
    params.require(:item).permit(
      :title, 
      :description, 
      :category_id, 
      :brand, 
      :condition_id, 
      :prefecture_id, 
      :shipping_fee_burden_id, 
      :shipping_method_id, 
      :shipping_duration_id, 
      :price,
      images_attributes: [:id,:image]
    ).merge(user_id: current_user.id)
  end 

  def set_item
    @item = Item.find(params[:id])
  end

end
