class ItemsController < ApplicationController
  before_action :authenticate_user!, except: :index
  layout 'application.users', except: [:index,:show]

  def index
    
  end

  def new
    @item = Item.new
    @item.user_id=current_user.id
    @item.images.build
    @categories = Category.where(ancestry: nil, size_id: nil).order("id ASC") #テーブルからカテゴリーを取得
    session[:user_id]=current_user.id #出品するユーザーID情報を取得
    binding.pry
  end

  def create
    # @item = Item.new(
    #   title: params_new[:title],
    #   description: params_new[:description],
    #   price: params_new[:price],
    #   category_id: params_new[:category_id],
    #   brand_id: params_new[:brand_id],
    #   condition: params_new[:condition],
    #   region: params_new[:region],
    #   shipping_fee_burden: params_new[:shipping_fee_burden],
    #   shipping_method: params_new[:shipping_method],
    #   shipping_duration: params_new[:shipping_duration],
    #   user_id: session[:user_id]
    # )
    @item = Item.new(params_new)
    @item.images.build(params_new[images_attributes: [:image,:id]])
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
      :user_id,
      images_attributes: [:id,:image]
    )
    
  end

  def buy
    
  end

end
