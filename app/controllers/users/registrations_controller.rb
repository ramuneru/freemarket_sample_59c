# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_user
  # before_action :configure_account_update_params, only: [:update]
  layout "application.users"
  layout "application.registration"
  
  def index
    render layout: "application.users"
  end

  def profile
    # @user = User.new
    # @address = Address.new
    # @user_profile = UserProfile.new
    render layout: "application.registration"
  end

  def phone
    render layout: "application.registration"
    session[:email] = user_params[:email]
    session[:encrypted_password] = user_params[:encrypted_password]
    session[:password] = user_params[:password]
    session[:user_profile_attributes] = user_params[:user_profile_attributes]
    user_profile_attributes={}
    user_profile_attributes["birth_year"]=birthday_join_params[:'birth_year(1i)']
    user_profile_attributes["birth_month"]=birthday_join_params[:'birth_year(2i)']
    user_profile_attributes["birth_day"]=birthday_join_params[:'birth_year(3i)']
    session[:birth_day_attributes]=user_profile_attributes
    session[:user_profile_attributes].merge!(session[:birth_day_attributes])
  end

  def phone_authen
    render layout: "application.registration" 
    session[:phone]=user_params[:phone] 
  end

  def address
    render layout: "application.registration" 
  end

  def credit
    render layout: "application.registration" 
    session[:address_attributes] = user_params[:address_attributes]
  end

  def complete
  end

  def create
    @user = User.new(
      email: session[:email],
      encrypted_password: session[:encrypted_password],
      password: session[:password],
      phone: session[:phone]
    )
    @user.build_user_profile(session[:user_profile_attributes])
    @user.build_address(session[:address_attributes])
    # binding.pry
    if @user.save
      session[:id] = @user.id
      redirect_to :index
    else
      redirect_to :index
    end
  end

  private
  
  def user_params
    params.require(:user).permit(
      :email,
      :encrypted_password,
      :password,
      :phone,
      user_profile_attributes: [:id,:nickname,:family_name,:last_name,:family_name_kana,:last_name_kana,:birth_year,:birth_month,:birth_date],
      address_attributes: [:id,:postal_code,:region,:city,:block,:building,:phone]
    ) 
  end
 
  def birthday_join_params
    # パラメータ取得
    params.require(:birth_date).permit(:'birth_year(1i)',:'birth_year(2i)',:'birth_year(3i)')
    #date=params[:birth_date]
    # エラー回避 未選択だったら何もしない
    # if date["birth_year(1i)"].empty? && date["birth_year(2i)"].empty? && date["birth_year(3i)"].empty?
    #    return
    # else
      # params[:birth_year] = date["birthday(1i)"]
      # params[:birth_month] = date["birthday(2i)"]
      # params[:birth_date] = date["birthday(3i)"]
      # 年月日別々できたものを結合して新しいDate型変数を作って返す
      # Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i
    
    #end
  end

  def set_user
    @user=User.new
    @user.build_user_profile
    @user.build_address
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
