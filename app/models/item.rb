class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash  :prefecture
  belongs_to_active_hash  :condition
  belongs_to_active_hash  :shipping_fee_burden
  belongs_to_active_hash  :shipping_method
  belongs_to_active_hash  :shipping_duration
  belongs_to              :user
  belongs_to              :category
  belongs_to              :size, optional: true
  
  has_many                :images, dependent: :destroy
  validates_presence_of  :images, message: "を登録してください"
  
  validates_presence_of  :title, :description
  validates_presence_of  :category, :condition, :prefecture
  validates_presence_of  :shipping_fee_burden, :shipping_method, :shipping_duration
  
  validates      :title, length:{ maximum: 40, message: 'を40文字以内で入力してください'} 
  validates      :price, presence: true, numericality: { only_integer: true, greater_than: 300, less_than: 10000000, message: "を300円以上、9,999,999円以下で半角入力してください"}

 

  accepts_nested_attributes_for :images
  enum status: [:listing, :progress, :complete]

  # validates      :size, presence: true, if: :category_with_size?
  # def category_with_size?
  #   return true if  category_id.include?(:size_id)
  # end
end
