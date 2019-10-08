class CardController < ApplicationController
  require "payjp"
  
  def new
    card = Card.where(user_id: current_user.id)
    # if card.exists?
    #   redirect_to "/card/:id"
    # end
  end

  def pay 
    #payjpとCardのデータベース作成を実施します。
    binding.pry
    Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    if params['payjp-token'].blank?
      redirect_to new_card_path
    else
      customer = Payjp::Customer.create(
        description: '登録テスト', 
        email: current_user.email,
        card: params['payjp-token'],
        metadata: {user_id: current_user.id}
      ) 
      @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if @card.save
        redirect_to card_path
      else
        redirect_to pay_card_index_path
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    
    card = Card.where(user_id: current_user.id).first
    # if card.blank?
    # else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    # end
      redirect_to confirmation_card_index_path
  end

  def show #Cardのデータpayjpに送り情報を取り出します
    # @card = Card.new
    @card = Card.where(user_id: current_user.id).first
    if @card
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)
    end
  end

  private

  def get_payjp_info
    if Rails.env == 'development'
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    else
      Payjp.api_key = Rails.application.credentials.payjp[:PAYJP_PRIVATE_KEY]
    end
  end
end