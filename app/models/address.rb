class Address < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user, optional: true
  belongs_to_active_hash :prefecture

  validates :postal_code, presence: true ,format:{with: /\A\d{3}[-]\d{4}\z/, message: 'ハイフン入り７桁で入力してください'}
  validates :prefecture_id, presence: true
  validates :city, presence: true 
  validates :block, presence: true
  #validates :phone, uniqueness: true,length: {is:11}
end
