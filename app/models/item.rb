class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee_burden
  belongs_to_active_hash :shipping_method
  belongs_to_active_hash :shipping_duration
  belongs_to     :user, optional: true
  belongs_to     :category, dependent: :destroy
  belongs_to     :size, optional: true
  has_many       :images, dependent: :destroy
  validates      :images, presence: true

  accepts_nested_attributes_for :images
  enum status: [:listing, :progress, :complete]
end
