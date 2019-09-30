# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_user
  # before_action :configure_account_update_params, only: [:update]
  layout 'application.users', except: [:profile,:phone]
  
  def index
  end

  def profile
    # @user = User.new
    # @address = Address.new
    # @user_profile = UserProfile.new
    render layout: "application.users"
  end

  def phone
    render layout: "application.users"

    session[:phone] = user_params[:phone]
    session[:email] = user_params[:email]
    session[:encrypted_password] = user_params[:encrypted_password]
    session[:passwordCheck] = user_params[:passwordCheck]
    # session[:nickname] = user_profile_params[:nickname]
    # session[:family_name] = user_profile_params[:family_name]
    # session[:last_name] = user_profile_params[:last_name]
    # session[:family_name_kana] = user_profile_params[:family_name_kana]
    # session[:last_name_kana] = user_profile_params[:last_name_kana]
    # session[:dateOfbirth] = birthday_join_params(user_profile_params[:dateOfbirth])
    # session[:birth_year] = birthday_join_params(user_profile_params[:birth_year])
    # session[:birth_month] = birthday_join_params(user_profile_params[:birth_month])
    # session[:birth_date] = birthday_join_params(user_profile_params[:birth_date])
    # session[:birth_year] = birthday_join(user_profile_params[:birth_year])
    # session[:birth_month] = birthday_join(user_profile_params[:birth_month])
    # session[:birth_date] = birthday_join(user_profile_params[:birth_date])
    # @user = User.new
    # @address = Address.new
    # @user_profile = UserProfile.new
  end

  def phone_authen
  end

  def address
  end

  def credit
  end

  def complete
  end

  def create
    @user = User.new(
      email: session[:email],
      encrypted_password: session[:encrypted_password],
      nickname: session[:nickname],
      phone: session[:phone]
    )
    @user.build_user_profile(session[:user_profile_attributes])
    @user.build_address(session[:address_attributes])
  end

  private
  def set_user
    @user = User.new
    @user.build_user_profile
    @user.build_address
  end

  def user_params
    params.require(:user).permit(
      :email,
      :encrypted_password,
      :passwordCheck,
      :phone,
      user_profile_attributes: [:id,:nickname,
        :family_name,:last_name,
        :family_name_kana,:last_name_kana,
        :birth_year,:birth_month,:birth_date],
      address_attributes: [:id,:postal_code,:region,:city,:building,:phone]
    ) 
  end
    # def user_profile_params
    #   params.require(:user_profile).permit(
    #     :nickname,
    #     :family_name, 
    #     :last_name, 
    #     :family_name_kana, 
    #     :last_name_kana,
    #     :dateOfbirth,
    #     :birth_year,
    #     :birth_month,
    #     :email,
    #     :birth_date
    #   )
    # end
    # def address_params
    #   params.require(:address).permit(
    #     :user,
    #     :postal_code,
    #     :region,
    #     :city,
    #     :building,
    #     :phone
    #   )
    # end
    def birthday_join_params
      # パラメータ取得
      date = params[:user][:dateOfbirth]

      # エラー回避 未選択だったら何もしない
      if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
        return
      else
        params[:birth_year] = date["birthday(1i)"]
        params[:birth_month] = date["birthday(2i)"]
        params[:birth_date] = date["birthday(3i)"]
        # 年月日別々できたものを結合して新しいDate型変数を作って返す
        Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

      end
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
