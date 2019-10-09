class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  
  layout 'application.users', except: [:index,:show]

  def index
  end

  def new
    @category_parent = Category.where(ancestry: nil)

  end

  def create
    @item = Item.new(params_new)
  end

  def edit

  end


  def show
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
    params.require(:item).permit(:title, :description, :category_id, :brand_id, :status, :size_id, :region, :shipping_fee_burden, :shipping_method, :shipping_duration, :price, images_attributes: [:image])
  end

  def buy
    
  end

  # def item_params
  #   params.require(:item).permit(
  #     :name,
  #     :text,
  #     :price,
  #   ).merge(user_id: current_user.id)
  # end
end
