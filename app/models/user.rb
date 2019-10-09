class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable  
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable,
            :omniauthable, omniauth_providers: [:facebook, :google_oauth2]

  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  
  has_many :items


  has_many :cards

  has_many :sns_credentials, dependent: :destroy
  #VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  #validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :phone,                   presence: true, uniqueness: true,length: {is:11}    


  def self.find_oauth(auth)
    uid = auth.uid
    provider = auth.provider
    snscredential = SnsCredential.find_by(uid: uid, provider: provider)
    pass = Devise.friendly_token[0, 20]
    

    if snscredential.present? 
      user = User.find_by(id: snscredential.user_id)
      
      unless user.present? 
        user = User.new(
          email: auth.info.email,
          password: pass,
          encrypted_password: pass
        )
        user_profile = UserProfile.new(
          nickname: auth.info.name
        )
      end
      sns = snscredential

    else 
      user = User.find_by(email: auth.info.email)
      if user.present? 
        sns = SnsCredential.create(
          uid: uid,
          provider: provider,
          user_id: user.id
        )
      else 
        user = User.new(
          email: auth.info.email,
          password: pass,
          encrypted_password: pass
        )

        user_profile = UserProfile.new(
          nickname: auth.info.name
        )
        sns = SnsCredential.new(
          uid: uid,
          provider: provider
        )
      end
    end
    return { user: user ,user_profile: user_profile, sns_id: sns }
  end
end