class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout 'application.users', except: [:index,:show]

  def index
    @item = Item.find(1)
    # @ladies_items = Item.where(category_id: 1).order("created_at DESC").limit(10)
    # @mens_items = Item.where(category_id: 200).order("created_at DESC").limit(10)
    
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

  # 削除
  def destroy
    @item = Item.find(2)
    @item.destroy
    redirect_to profile_users_path
  end

  def show
    @item = Item.find(2)
    @condition = Condition.find(@item.condition).condition
    @region = Prefecture.find(@item.region).name
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
      :condition, 
      :region, 
      :shipping_fee_burden, 
      :shipping_method, 
      :shipping_duration, 
      :price,
      images_attributes: [:id,:image]
    ).merge(user_id: current_user.id)
  end 

  def buy
    
  end

end
