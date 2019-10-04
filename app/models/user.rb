class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable
          
  has_one :user_profile, dependent: :destroy
  accepts_nested_attributes_for :user_profile

  has_one :address, dependent: :destroy
  accepts_nested_attributes_for :address
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,                   presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :password,                presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :password_confirmation,   presence: true, length: {minimum: 7, maximum: 128},on: :save_to_session_before_phone
  validates :phone,                   presence: true, uniqueness: true,length: {is:11}    
end