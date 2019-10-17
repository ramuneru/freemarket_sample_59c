class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :set_user
  
  layout "application.users"
  layout "application.registration"
  
  def index
    render layout: "application.users"
  end

  def profile
    
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

  # 新規登録時のクレカと登録未実装の為
  # def credit
    # render layout: "application.registration" 
    # session[:address_attributes] = user_params[:address_attributes]
  # end

  # creditアクション内のsessionを完了画面に変更
  def complete
    session[:address_attributes] = user_params[:address_attributes]
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
    
    if @user.save
      session[:id] = @user.id
      sign_in User.find(session[:id]) unless user_signed_in?
      # session.clear
      redirect_to root_path
    else
      # session.clear
      redirect_to profile_path
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
      address_attributes: [:id,:postal_code,:prefecture_id,:city,:block,:building,:phone]
    ) 
  end
 
  def birthday_join_params
    params.require(:birth_date).permit(:'birth_year(1i)',:'birth_year(2i)',:'birth_year(3i)')
  end

  def set_user
    @user=User.new
    @user.build_user_profile
    @user.build_address
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end  
end
