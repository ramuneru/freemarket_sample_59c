class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, except: :index
  before_action :set_item, only: [:show, :destroy, :buy, :pay]
  before_action :set_item_detail, only: [:buy]
  before_action :set_user_detail, only: [:buy, :pay]
  layout 'application.users', except: [:index, :show]
  def index

    @ladies_items = Item.where(category_id: 1..199).order("created_at DESC").limit(10)
    @mens_items = Item.where(category_id: 200..344).order("created_at DESC").limit(10)
  end

  def new
    @item = Item.new
    @item.images.build
    @category_parent = Category.roots
  end

  def buy
    @card = Card.where(user_id: current_user.id).first
    if @card.present?
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]

      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(@card.customer_id)

      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(@card.card_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      # 登録しているカード会社のブランドアイコンを表示する
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    else

      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "show"
    end
  end

  def create
    @item = Item.new(params_new)
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
    @item.destroy
    redirect_to profile_users_path
  end

  def show    
  end

  def pay

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
  )
    # ここで商品状態の更新
    @item.update(status: 1)
    redirect_to action: 'complete'
  end

  def complete
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
      :size_id,
      images_attributes: [:id,:image]
    ).merge(user_id: current_user.id,category_id: params[:category])
  end 

  def set_item
    @item = Item.find(params[:id])
  end

  def set_item_detail
    if current_user.id == @item.user_id
      # 出品状態であるか否や
      redirect_to root_path
    end
  end

  def set_user_detail
    @address = Address.find(current_user.id)
    @user_profile = UserProfile.find(current_user.id)
  end
end