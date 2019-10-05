class SignupController < ApplicationController
  layout 'application.user', except: [:profile,:phone]

  def index
  end

  def profile
    @user = User.new
    @address = Address.new
    @user_profile = UserProfile.new
    
    render layout: 'application.user'
  end

  def phone
    session[:phone] = user_params[:phone]
    session[:email] = user_params[:email]
    session[:encrypted_password] = user_params[:encrypted_password]
    # session[:passwordCheck] = user_params[:passwordCheck]
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
    @user = User.new
    @address = Address.new
    @user_profile = UserProfile.new
    render layout: 'application.user'
  end

  def phone_authen
    render layout: 'application.user'
  end

  def address
    render layout: 'application.user'
  end

  def credit
    render layout: 'application.user'
  end

  def complete
  end

  private
    def user_params
      params.require(:user).permit(
        :phone,
        :email, 
        :encrypted_password,
        :passwordCheck
      )
      
    end
    def user_profile_params
      params.require(:user_profile).permit(
        :nickname,
        :family_name, 
        :last_name, 
        :family_name_kana, 
        :last_name_kana,
        :dateOfbirth,
        :birth_year,
        :birth_month,
        :birth_date
      )
    end
    def address_params
      params.require(:address).permit(
        :user,
        :postal_code,
        :region,
        :city,
        :building,
        :phone
      )
    end
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
end
