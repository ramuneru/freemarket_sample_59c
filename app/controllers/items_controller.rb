class ItemsController < ApplicationController
  require 'payjp'
  before_action :authenticate_user!, only: [:edit, :update, :destroy]
  before_action :set_item, only: [:show, :destroy, :buy, :pay, :edit, :update]
  before_action :set_item_detail, only: [:buy]
  before_action :set_user_detail, only: [:buy, :pay]
  before_action :set_selected_value, only: [:edit, :update]
  layout 'application.users', except: [:index, :show]
  
  def index
    @all_new_items = Item.order("created_at DESC").limit(10)
    @ladies_items = Item.where(category_id: 1..199).order("created_at DESC").limit(10)
    @mens_items = Item.where(category_id: 200..344).order("created_at DESC").limit(10)
    @ele_app_items = Item.where(category_id: 893..977).order("created_at DESC").limit(10)

    # @root_category = Category.all.where(ancestry: nil)
  end

  def new
    @item = Item.new
    @item.images.build
  end

  # 出品
  def create
    @item = Item.new(params_new)
    if @item.save
      redirect_to root_path
    else
      @item.images.build
      render :new
    end
  end

  # 編集ページ
  def edit
    # set_selected_value を定義しています

  end

  # 削除
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render action: :show
    end
  end

  # 更新
  def update
    
    if params_new[:size_id].nil?
      params_update = params_new.merge(size_id: nil)  
    elsif params_new.has_key?(:size_id)
      params_update = params_new.merge(size_id: params_new[:size_id])
    else
      params_update = params_new
    end
    
    if @item.update(params_update)
      redirect_to item_path
    else
      # @item.images.build
      # @item = Item.find(params[:id])
      render :edit
    end
  end    
  
  def show    
  end
  
  # 購入ページ
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

  # 購入
  def pay

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    Payjp::Charge.create(
    amount: @item.price,
    customer: card.customer_id,
    currency: 'jpy',
  )
    # ここで商品状態の更新
    @item.update(status: 2)
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
    ).merge(user_id: current_user.id)
  end 

  def set_item
    @item = Item.find(params[:id])
  end

  def id_params
    params.permit(:id)
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

  def set_selected_value
    # editページ  選択済みページ
    @category_new = @item.category
    @category = @item.category.root
    @category_children = @item.category.parent.siblings
    @category_grandchildren = @item.category.siblings

    @category_new = @item.category
    @sizes = @item.size.siblings unless @item.size_id.nil?
    @size_id = @item.size.id unless @item.size .nil?
    @fee = (@item.price * 0.1).floor
    @profit = (@item.price - @fee).to_s
  end
end