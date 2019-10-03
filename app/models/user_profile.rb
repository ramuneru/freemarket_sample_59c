class UserProfile < ApplicationRecord
  belongs_to :user, optional: true # 応急処置オプしょなるあとではずす？

  validates :nickname, presence: true
  validates :family_name, presence: true,format:{with: /\A[ぁ-んァ-ン一-龥]\Z/, message: '全角で入力してください'}
  validates :last_name, presence: true,format:{with: /\A[ぁ-んァ-ン一-龥]\Z/, message: '全角で入力してください'}
  validates :family_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :last_name_kana, presence: true,format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  validates :birth_year, presence: true
  validates :birth_month, presence: true
  validates :birth_day, presence: true
  
end
