class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_duration
  belongs_to :user, optional: true
  belongs_to :category, dependent: :destroy
  has_many :images
  accepts_nested_attributes_for :images


end
