class UsersController < ApplicationController
  before_action :set_user , only: [:index,:profile]
  before_action :set_item_list, only: [:product, :completed]

  def index
  end

  def profile  
  end

  def product
  end

  def completed
  end

  private
  def set_user
    @address = Address.find(current_user.id)
    @user_profile = UserProfile.find(current_user.id)
  end

  def set_item_list
    @user_item_list = Item.where(user_id: current_user.id)
  end
end
